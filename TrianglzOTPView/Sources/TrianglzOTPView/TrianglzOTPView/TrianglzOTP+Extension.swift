//
//  File.swift
//  
//
//  Created by Nour Gweda on 31/07/2023.
//

import Foundation

extension TrianglzOTPView {

    private func setupOnTextFieldValueChanged(index: Int, newValue: String) {
        if newValue.count > 0 {
            handleFullTextFieldValue(index: index, newValue: newValue)
        } else if newValue.isEmpty {
            handleEmptyTextFieldValue(index: index, newValue: newValue)
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

    private func isAllNextFieldsEmpty(currentIndex: Int) {
        for index in currentIndex..<data.count {
            if !data[index].isEmpty {
                allAfterSpecificIndexEmpty = false
                break
            }
            allAfterSpecificIndexEmpty = true
        }
    }

    private func handleFullTextFieldValue(index: Int, newValue: String) {
        if index == internalData.startIndex || !internalData[previousIndex].isEmpty {
            internalData[index] = String(newValue.prefix(1))
            focusNextTextField(currentIndex: lastIndex)
        }
        else {
            internalData[index] = ""
            focusNextTextField(currentIndex: index)
        }
    }

    private func handleEmptyTextFieldValue(index: Int, newValue: String) {
        if index == internalData.endIndex || index == lastIndex {
            isAllNextFieldsEmpty(currentIndex: index)
            if allAfterSpecificIndexEmpty {
                internalData[index] = ""
                focusPreviousTextField(currentIndex: index)
            }
        } else {
            focusNextTextField(currentIndex: lastIndex)
        }
    }

    private func handleOnCompleteAction() {
        isAllDataEntered = data.filter({ !$0.isEmpty }).count == textFieldCount
        if isAllDataEntered {
            onCompleteCallback(data.joined(separator: ""))
        }
    }

    func handleOnChangeAction(index: Int, newValue: String) {
        setupOnTextFieldValueChanged(index: index, newValue: newValue)
        onChangeCallback?()
        data = internalData
        handleOnCompleteAction()
    }
}
