//
//  View+TFModifier.swift
//  
//

import Foundation
import SwiftUI

extension View {
    func customTextFieldModifier(customStyle: TrianglzOTPView.Style,
                                 index: Int,
                                 focusedTextField: FocusState<Int?>.Binding) -> some View {
        self
            .frame(width: customStyle.width, height: customStyle.height)
            .background(
                RoundedRectangle(cornerRadius: customStyle.cornerRadius)
                    .foregroundColor(customStyle.backgroundColor)
                    .overlay(
                        RoundedRectangle(cornerRadius: customStyle.cornerRadius)
                            .stroke(customStyle.borderColor, lineWidth: customStyle.borderWidth)
                    )
            )
            .foregroundColor(customStyle.foregroundColor)
            .shadow(
                color: customStyle.shadowColor,
                radius: customStyle.shadowRadius,
                x: customStyle.shadowXOffset,
                y: customStyle.shadowYOffset
            )
            .focused(focusedTextField, equals: index)
            .lineLimit(1)
            .accentColor(customStyle.isCursorHidden ? .clear : customStyle.foregroundColor)
    }
}
