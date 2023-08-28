//
//  File.swift
//  
//
//  Created by Nour Gweda on 28/08/2023.
//

import Foundation
import SwiftUI

extension View {
    func customTextFieldModifier(customStyle: TrianglzOTPView.CustomStyle,
                                 index: Int,
                                 focusedTextField: FocusState<Int?>.Binding) -> some View {
        self
            .frame(width: customStyle.width, height: customStyle.height)
            .background(
                RoundedRectangle(cornerRadius: customStyle.cornerRadius)
                    .stroke(customStyle.borderColor, lineWidth: customStyle.borderWidth)
                    .foregroundColor(customStyle.backgroundColor)
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
