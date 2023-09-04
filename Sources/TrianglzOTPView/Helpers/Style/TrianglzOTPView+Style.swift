//
//  TrianglzOTPView+Style.swift
//  
//

import Foundation
import SwiftUI

extension TrianglzOTPView {
   public struct Style {
        var foregroundColor: Color
        var fontStyle: UIFont
        var hstackSpacing: CGFloat
        var hstackAlignment: VerticalAlignment = .center
        var borderColor: Color = .clear
        var width: CGFloat = 50
        var height: CGFloat = 50
        var backgroundColor: Color = .clear
        var cornerRadius: CGFloat = 10
        var borderWidth: CGFloat = 1
        var shadowColor: Color = .clear
        var shadowRadius: CGFloat = 0
        var shadowXOffset: CGFloat = 0
        var shadowYOffset: CGFloat = 0
        var isCursorHidden: Bool = false
    }
}
