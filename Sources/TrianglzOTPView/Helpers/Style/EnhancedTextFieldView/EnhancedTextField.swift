//
//  EnhancedTextField.swift
//
//

import Foundation
import SwiftUI

struct EnhancedTextField: UIViewRepresentable {
    @Binding var data: [String]
    @Binding var currentIndex: Int
    @Binding var text: String
//    var internalData: [String] = []
    let font: UIFont
    let fontColor: UIColor
    let onBackspace: (Bool) -> Void
    let onChange: (String) -> Void

    func makeCoordinator() -> EnhancedTextFieldCoordinator {
        EnhancedTextFieldCoordinator(textBinding: $text, onChange: onChange,
                                     data: $data,
//                                     internalData: internalData,
                                     currentIndex: $currentIndex)
    }

    func makeUIView(context: Context) -> EnhancedUITextField {
        let view = EnhancedUITextField()
        view.delegate = context.coordinator
        view.text = text
        view.textAlignment = .center
        view.keyboardType = .asciiCapableNumberPad
        view.font = font
        view.textColor = fontColor
        return view
    }

    func updateUIView(_ uiView: EnhancedUITextField, context: Context) {
        uiView.text = text
        uiView.onBackspace = onBackspace
    }

    class EnhancedUITextField: UITextField {
        var onBackspace: ((Bool) -> Void)?

        override init(frame: CGRect) {
            onBackspace = nil
            super.init(frame: frame)
        }

        required init?(coder: NSCoder) {
            fatalError()
        }

        override func deleteBackward() {
            onBackspace?(text?.isEmpty == true)
            super.deleteBackward()
        }
    }
}
