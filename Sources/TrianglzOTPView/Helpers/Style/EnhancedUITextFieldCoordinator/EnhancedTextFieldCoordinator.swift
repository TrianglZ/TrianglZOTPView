//
//  EnhancedTextFieldCoordinator.swift
//
//

import Foundation
import SwiftUI

class EnhancedTextFieldCoordinator: NSObject {
    let textBinding: Binding<String>
    var onChange: ((String) -> Void)?
    var data: Binding<[String]>
    var internalData: [String]
    var currentIndex: Binding<Int>

    init(textBinding: Binding<String>, onChange: @escaping (String) -> Void,
         data: Binding<[String]>,
         internalData: [String],
         currentIndex: Binding<Int>) {
        self.textBinding = textBinding
        self.onChange = onChange
        self.data = data
        self.internalData = internalData
        self.currentIndex = currentIndex
    }
}
