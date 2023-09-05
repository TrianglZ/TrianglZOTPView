//
//  EnhancedTF+Extension.swift
//
//

import Foundation
import SwiftUI

extension EnhancedTextFieldCoordinator: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""

        setUserDefaultsData(newText: newText)

        if getNonEmptyCount(array: internalData) == data.count {
                debugPrint("Saved Array: \(internalData)")
                data.wrappedValue = internalData
                internalData = []
                return true
            }

        if !newText.isEmpty && (newText.count == 1) && areElementsNotEmpty() {
            textBinding.wrappedValue = String(newText.prefix(1))
            onChange?(newText)
            return false
        } else if newText.count > 1 {
            if currentIndex.wrappedValue != (data.count - 1) {
                let secondCharacter = newText[newText.index(newText.startIndex, offsetBy: 1)]
                data.wrappedValue[currentIndex.wrappedValue + 1] = String(secondCharacter)
            }
            onChange?(newText)
            return false
        } else {
            return true
        }
    }

    func setUserDefaultsData(newText: String) {
        if newText.count == 1 {
            internalData.append(String(newText))
            internalData.removeAll { $0.isEmpty }
        }
    }

    func getNonEmptyCount(array: [String]) -> Int {
        var nonEmptyCount = 0
        for item in array {
            if !item.isEmpty {
                nonEmptyCount += 1
            }
        }
        return nonEmptyCount
    }

    func areElementsNotEmpty() -> Bool {
        let subArray = data.prefix(currentIndex.wrappedValue)
        return subArray.allSatisfy { !$0.wrappedValue.isEmpty }
    }
}
