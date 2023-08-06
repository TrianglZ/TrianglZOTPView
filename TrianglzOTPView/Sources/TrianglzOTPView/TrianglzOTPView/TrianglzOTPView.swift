import SwiftUI

public struct TrianglzOTPView: View {

    // MARK: - Data Variables
    internal var textFieldCount: Int
    @State internal var data: [String] = []
    @State internal var internalData: [String] = []
    @State internal var allAfterSpecificIndexEmpty: Bool = true
    @FocusState internal var focusedTextField: Int?

    // MARK: - Internal State Variables
    @State internal var previousIndex: Int = 0
    @State internal var lastIndex: Int = 0
    @State internal var firstIndex: Int = 0

    // MARK: - Style Variables
    internal var customStyle: CustomStyle

    // MARK: - Callback Closures
    internal var onChangeCallback: ((String) -> Void)?
    internal var onCompleteCallback: ((String) -> Void)

    public init(textFieldCount: Int,
                customStyle: CustomStyle,
                onChangeCallback: ((String) -> Void)? = nil,
                onCompleteCallback: @escaping ((String) -> Void)) {
        self.textFieldCount = textFieldCount
        self.customStyle = customStyle
        self.onChangeCallback = onChangeCallback
        self.onCompleteCallback = onCompleteCallback
    }

    public var body: some View {
        HStack(alignment: customStyle.vstackAlignment,
               spacing: customStyle.vstackSpacing) {
            ForEach(data.indices, id: \.self) { item in

                TextField("", text: $data[item])
                    .textFieldStyle(CustomTextFieldStyle(customStyle: customStyle))
                    .keyboardType(.asciiCapableNumberPad)
                    .multilineTextAlignment(.center)
                    .focused($focusedTextField, equals: item)
                    .onChange(of: data[item]) { newValue in
                        previousIndex = max(item - 1, 0)
                        lastIndex = internalData.lastIndex(where: { !$0.isEmpty }) ?? 0
                        handleOnChangeAction(index: item, newValue: newValue)
                    }
            }
        }.onAppear {
            data = Array(repeating: "", count: textFieldCount)
            internalData = data
        }.onTapGesture {
            setUpFocusTextFieldValue()
        }
        .onTapGesture(count: 2) {
            setUpFocusTextFieldValue()
        }
        .onChange(of: focusedTextField) { newValue in
            guard let newValue else { return }
            handleFocusValueChange(newValue: newValue)
        }
    }
}
