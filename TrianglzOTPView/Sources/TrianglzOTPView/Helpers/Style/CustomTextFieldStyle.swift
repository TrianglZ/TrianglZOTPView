//
//  File.swift
//  
//
//  Created by Nour Gweda on 27/07/2023.
//

import Foundation
import SwiftUI

public struct CustomTextFieldStyle: TextFieldStyle {
    var customStyle: CustomStyle

    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .frame(width: customStyle.width, height: customStyle.height)
            .background(
                RoundedRectangle(cornerRadius: customStyle.cornerRadius)
                    .foregroundColor(customStyle.backgroundColor)
                    .border(customStyle.borderColor, width: customStyle.borderWidth)
            )
            .foregroundColor(customStyle.foregroundColor)
            .font(customStyle.fontStyle)
            .shadow(color: customStyle.shadowColor,
                    radius: customStyle.shadowRadius,
                    x: customStyle.shadowXOffset,
                    y: customStyle.shadowYOffset)
    }
}
