//
//  TrianglzOTPView.swift
//
//

import SwiftUI

public struct TrianglzOTPView: View {

	// MARK: - Data Variables
	let inputType: TrianglzOTPInputType
	var textFieldCount: Int
	@State var data: [String] = []
	@State internal var internalData: [String] = []
	@FocusState var focusedTextField: Int?

	// MARK: - State Variables
	@State var lastIndex: Int = 0
	@State private var isViewAppeared: Bool = false

	// MARK: - Style Variables
	var customStyle: Style

	// MARK: - Callback Closures
	var onChangeCallback: ((String) -> Void)?
	var onCompleteCallback: ((String) -> Void)

	// MARK: - Binding Variables
	@Binding var shouldDismissKeyboard: Bool

	public init(textFieldCount: Int,
				customStyle: Style,
				inputType: TrianglzOTPInputType = .digits,
				onChangeCallback: ((String) -> Void)? = nil,
				onCompleteCallback: @escaping ((String) -> Void),
				shouldDismissKeyboard: Binding<Bool>) {
		self.textFieldCount = textFieldCount
		self.customStyle = customStyle
		self.inputType = inputType
		self.onChangeCallback = onChangeCallback
		self.onCompleteCallback = onCompleteCallback
		_shouldDismissKeyboard = shouldDismissKeyboard
	}

	private var keyboardType: UIKeyboardType {
		switch inputType {
		case .digits:
			return .asciiCapableNumberPad
		case .digitsAndAlphabets:
			return .alphabet
		}
	}

	private var focusedStateFontColor: UIColor? {
		guard let focusedStateColor = customStyle.focusedStateColor else {
			return nil
		}
		return UIColor(focusedStateColor)
	}

	public var body: some View {
		HStack(alignment: customStyle.hstackAlignment,
			   spacing: customStyle.hstackSpacing) {
			ForEach(data.indices, id: \.self) { index in

				EnhancedTextField(data: $data,
								  internalData: $internalData,
								  currentIndex: .constant(index),
								  text: $data[index],
								  font: customStyle.fontStyle,
								  fontColor: UIColor(customStyle.foregroundColor),
								  keyboardType: keyboardType,
								  focusedStateFontColor: focusedStateFontColor,
								  onBackspace: { isEmpty in
					handleOnBackAction(isEmpty: isEmpty, index: index)
				},onChange: { newValue in
					handleOnChangeAction()
				})
				.customTextFieldModifier(customStyle: customStyle, index: index, focusedTextField: $focusedTextField)
			}
		}.environment(\.layoutDirection, .leftToRight)
			.onAppear {
				if !isViewAppeared {
					setUpData()
					isViewAppeared.toggle()
				}
			}
			.onTapGesture {
				focusedTextField = getFocusedTextField()
			}.onChange(of: shouldDismissKeyboard, perform: { newValue in
				if newValue {
					focusedTextField = nil
				}
			}).onChange(of: focusedTextField) { newValue in
				guard let newValue else { return }
				handleOnChangeFocus(newValue: newValue)
			}.onChange(of: data, perform: { newValue in
				onChangeCallback?(data.joined(separator: ""))
				if isAllDataFull() {
					lastIndex = data.endIndex
					handleOnCompleteAction()
					focusedTextField = nil
				}
			})
	}
}
