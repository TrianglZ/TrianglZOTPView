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

        public init() {
            foregroundColor = .black
            fontStyle = .systemFont(ofSize: 15)
            hstackSpacing = 8
            borderColor = .gray
            backgroundColor = .white
        }

        public init(foregroundColor: Color,
                    fontStyle: UIFont,
                    hstackSpacing: CGFloat,
                    hstackAlignment: VerticalAlignment = .center,
                    borderColor: Color = .clear,
                    width: CGFloat = 50,
                    height: CGFloat = 50,
                    backgroundColor: Color = .clear,
                    cornerRadius: CGFloat = 10,
                    borderWidth: CGFloat = 1,
                    shadowColor: Color = .clear,
                    shadowRadius: CGFloat = 0,
                    shadowXOffset: CGFloat = 0,
                    shadowYOffset: CGFloat = 0,
                    isCursorHidden: Bool = false) {
            self.foregroundColor = foregroundColor
            self.fontStyle = fontStyle
            self.hstackSpacing = hstackSpacing
            self.hstackAlignment = hstackAlignment
            self.borderColor = borderColor
            self.width = width
            self.height = height
            self.backgroundColor = backgroundColor
            self.cornerRadius = cornerRadius
            self.borderWidth = borderWidth
            self.shadowColor = shadowColor
            self.shadowRadius = shadowRadius
            self.shadowXOffset = shadowXOffset
            self.shadowYOffset = shadowYOffset
            self.isCursorHidden = isCursorHidden
        }
    }
}
