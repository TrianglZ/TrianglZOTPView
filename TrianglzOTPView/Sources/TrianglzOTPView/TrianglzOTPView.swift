import SwiftUI

public struct TrianglzOTPView: View {

    // MARK: - Data Variables
    internal var textFieldCount: Int

    // MARK: - State Variables
    @State internal var data: [String] = []
    
    // MARK: - Style Variables
    internal var customStyle: CustomStyle
    
    // MARK: - Binding Variables
    @Binding internal var isAllDataEntered: Bool
    
    // MARK: - Callback Closures
    internal var onChangeCallback: (() -> Void)?
    internal var onCompleteCallback: ((String) -> Void)
        
        public init(textFieldCount: Int,
                    customStyle: CustomStyle,
                    isAllDataEntered: Binding<Bool>,
                    onChangeCallback: (() -> Void)? = nil,
                    onCompleteCallback: @escaping ((String) -> Void)) {
            self.textFieldCount = textFieldCount
            self.customStyle = customStyle
            self._isAllDataEntered = isAllDataEntered
            self.onChangeCallback = onChangeCallback
            self.onCompleteCallback = onCompleteCallback
        }
        
        public var body: some View {
            HStack(alignment: customStyle.vstackAlignment,
                   spacing: customStyle.vstackSpacing) {
                ForEach(data.indices, id: \.self) { index in

                    TextField("", text: $data[index])
                        .textFieldStyle(CustomTextFieldStyle(customStyle: customStyle))
                        .keyboardType(.asciiCapableNumberPad)
                        .multilineTextAlignment(.center)
                        .onChange(of: data[index]) { newValue in
                            onChangeCallback?()

                            // check if all textFields are filled to return the string
                            isAllDataEntered = data.filter({ !$0.isEmpty }).count == textFieldCount
                            if isAllDataEntered {
                                onCompleteCallback(data.joined(separator: ""))
                            }
                        }
                }
            }.onAppear {
                data = Array(repeating: "", count: textFieldCount)
            }
        }
    }
