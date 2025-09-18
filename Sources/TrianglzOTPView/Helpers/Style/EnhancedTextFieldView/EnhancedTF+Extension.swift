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

        // This internal array is primarily intended for storing values received via SMS, as they arrive one by one, necessitating a dedicated storage location

        // Handle paste or multi-character input by distributing characters across fields
        if string.count > 1 || newText.count > 1 {
            handlePastedString(string.count > 1 ? string : newText)
            return false
        }

        setInternalData(newText: newText)

        if getNonEmptyCount(array: internalData.wrappedValue) == data.count {
            data.wrappedValue = internalData.wrappedValue
                return true
            }

        if !newText.isEmpty && (newText.count == 1) && areElementsNotEmpty() {
            textBinding.wrappedValue = String(newText.prefix(1))
            onChange?(newText)
            return false
        } else {
            return true
        }
    }

    private func handlePastedString(_ pasted: String) {
        guard !pasted.isEmpty else { return }
        let characters = Array(pasted)

        var writeIndex = currentIndex.wrappedValue
        for character in characters {
            guard writeIndex < data.count else { break }
            data.wrappedValue[writeIndex] = String(character)
            writeIndex += 1
        }

        // Keep internalData aligned with current data
        internalData.wrappedValue = data.wrappedValue

        // Update the bound text for the current field to the first pasted character
        if currentIndex.wrappedValue < data.count {
            textBinding.wrappedValue = data.wrappedValue[currentIndex.wrappedValue]
        }

        // Notify change to advance focus / trigger completion
        onChange?(pasted)
    }

    func setInternalData(newText: String) {
        if newText.count == 1 && !newText.isEmpty {
            internalData.wrappedValue.append(String(newText))
        }
    }

    func getNonEmptyCount(array: [String]) -> Int {
        return array.filter({!$0.isEmpty}).count
    }

    func areElementsNotEmpty() -> Bool {
        let subArray = data.prefix(currentIndex.wrappedValue)
        return subArray.allSatisfy { !$0.wrappedValue.isEmpty }
    }
}
