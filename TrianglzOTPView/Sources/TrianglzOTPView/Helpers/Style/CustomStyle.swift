//
//  File.swift
//  
//
//  Created by Nour Gweda on 27/07/2023.
//

import Foundation
import SwiftUI

public struct CustomStyle {
    var foregroundColor: Color
    var fontStyle: Font
    var vstackSpacing: CGFloat
    var vstackAlignment: VerticalAlignment = .center
    var borderColor: Color = .clear
    var width: CGFloat = 50
    var height: CGFloat = 50
    var backgroundColor: Color = .black.opacity(0.5)
    var cornerRadius: CGFloat = 10
    var borderWidth: CGFloat = 2
    var shadowColor: Color = .clear
    var shadowRadius: CGFloat = 0
    var shadowXOffset: CGFloat = 0
    var shadowYOffset: CGFloat = 0
}
