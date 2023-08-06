//
//  File.swift
//  
//
//  Created by Nour Gweda on 31/07/2023.
//

import Foundation

extension TrianglzOTPView {

    func handleOnChangeAction(index: Int, newValue: String) {
        setupOnTextFieldValueChanged(index: index, newValue: newValue)
        onChangeCallback?(newValue)
        data = internalData
        handleOnCompleteAction()
    }

    private func setupOnTextFieldValueChanged(index: Int, newValue: String) {
        if newValue.count > 0 {
            handleFullTextFieldValue(index: index, newValue: newValue)
        } else if newValue.isEmpty {
            handleEmptyTextFieldValue(index: index, newValue: newValue)
        }
    }

    private func handleFullTextFieldValue(index: Int, newValue: String) {
        if newValue.count > 0 {
            if newValue.count == 1 {
                internalData[index] = String(newValue.prefix(1))
            } else {
                if !isAllStringsFull(array: internalData) && (index != internalData.endIndex) {
                    internalData[index + 1] = String(newValue.dropFirst())
                }
            }
            focusNextTextField(currentIndex: index)
        }
    }

    private func isAllStringsFull(array: [String]) -> Bool {
        for element in array {
            if element.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                return false
            }
        }
        return true
    }

    private func handleEmptyTextFieldValue(index: Int, newValue: String) {
        if index == internalData.endIndex || index == lastIndex {
            isAllNextFieldsEmpty(currentIndex: index)
            if allAfterSpecificIndexEmpty {
                internalData[index] = ""
                focusPreviousTextField(currentIndex: lastIndex)
            }
        } else {
            focusNextTextField(currentIndex: lastIndex)
        }
    }

    private func isAllNextFieldsEmpty(currentIndex: Int) {
        for index in currentIndex..<data.count {
            if !data[index].isEmpty {
                allAfterSpecificIndexEmpty = false
                break
            }
            allAfterSpecificIndexEmpty = true
        }
    }

    private func focusNextTextField(currentIndex: Int) {
        let nextIndex = min(currentIndex + 1, textFieldCount - 1)
        focusedTextField = nextIndex

    }

    private func focusPreviousTextField(currentIndex: Int) {
            let previousIndex = max(currentIndex - 1, 0)
            focusedTextField = previousIndex
    }

    private func handleOnCompleteAction() {
        if data.filter({ !$0.isEmpty }).count == textFieldCount {
            onCompleteCallback(data.joined(separator: ""))
        }
    }

    func setUpFocusTextFieldValue() {
        focusedTextField = internalData.firstIndex(where: { $0.isEmpty }) ?? (internalData.count - 1)
    }

    func handleFocusValueChange(newValue: Int) {
        let lastIndex = internalData.lastIndex(where: { !$0.isEmpty }) ?? (internalData.isEmpty ? 0 : (internalData.count - 1))
        if internalData.isEmpty && newValue < lastIndex {
            focusedTextField = lastIndex
        }
    }
}
