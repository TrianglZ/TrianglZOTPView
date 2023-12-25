//
//  TrianglzOTP+Extension.swift
//  
//

import Foundation

extension TrianglzOTPView {

    func setUpData() {
        data = Array(repeating: "", count: textFieldCount)
    }

    func handleOnBackAction(isEmpty: Bool, index: Int) {
        lastIndex = data.lastIndex(where: { !$0.isEmpty }) ?? (data.isEmpty ? 0 : (data.count - 1))

        if index == lastIndex {
            // The first condition handles the case where the user is in the first index and that index is empty to prevent exceptions. The second condition, in regular cases, deletes the value inside any non-empty index.
            if (index == data.startIndex && data[index].isEmpty) || !isEmpty {
                data[index] = ""
            } else {
                if isEmpty {
                    // "If the selected index is empty, proceed to delete the preceding index."
                    data[index - 1] = ""
                    if !internalData.isEmpty {
                        internalData[index - 1] = ""
                    }
                }
            }
            handleOnBackActionInternalData(index: index)
            focusPreviousTextField(currentIndex: index)
        } else {
            // This condition handles scenarios when the textField is empty, and the 'Back' button is pressed.
            // It ensures that the cursor moves to the previous text field and clears its value.
            handleOnBackActionIfNotEmptyIndex(index: index)
        }
    }

    private func handleOnBackActionInternalData(index: Int) {
        if !internalData.isEmpty {
            internalData.removeLast()
            
        } else if index == 0 {
            internalData = []
        }
    }

    private func handleOnBackActionIfNotEmptyIndex(index: Int) {
        if index > 0 && (index <= data.count - 1) {
            data[index - 1] = ""
            if (index - 1) >= internalData.startIndex && (index - 1) < internalData.endIndex {
                internalData.remove(at: index - 1)
            }
            focusNextTextField(currentIndex: lastIndex - 1)
        }
    }

    private func focusPreviousTextField(currentIndex: Int) {
        let previousIndex = max(currentIndex - 1, 0)
        focusedTextField = previousIndex
    }

    func handleOnChangeAction() {
        lastIndex = data.lastIndex(where: { !$0.isEmpty }) ?? 0
        focusNextTextField(currentIndex: lastIndex)
        onChangeCallback?(data.joined(separator: ""))
        handleOnCompleteAction()
    }

    private func focusNextTextField(currentIndex: Int) {
        let nextIndex = min(currentIndex + 1, textFieldCount - 1)
        focusedTextField = nextIndex
    }

    func handleOnCompleteAction() {
        if data.filter({ !$0.isEmpty }).count == textFieldCount {
            onCompleteCallback(data.joined(separator: ""))
        }
    }

    func getFocusedTextField() -> Int {
        let allDataIsEmpty = data.allSatisfy { $0.isEmpty }

        if allDataIsEmpty {
            return 0
        } else if isAllDataFull() {
            return lastIndex
        } else {
            return lastIndex + 1
        }
    }

    func isAllDataFull() -> Bool {
        return data.allSatisfy { !$0.isEmpty }
    }

    func handleOnChangeFocus(newValue: Int) {
        lastIndex = data.lastIndex(where: { !$0.isEmpty }) ?? (data.isEmpty ? 0 : (data.count - 1))
        if data.isEmpty && newValue < lastIndex {
            focusedTextField = lastIndex
        }
    }
}
