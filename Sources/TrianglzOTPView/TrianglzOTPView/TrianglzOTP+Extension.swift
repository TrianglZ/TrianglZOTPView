//
//  TrianglzOTP+Extension.swift
//  
//

import Foundation

extension TrianglzOTPView {

    func setUpData() {
        data = Array(repeating: "", count: textFieldCount)
        lastIndex = data.lastIndex(where: { !$0.isEmpty }) ?? 0
    }

    func handleOnBackAction(isEmpty: Bool, index: Int) {
        if (index == data.startIndex && data[index].isEmpty) || !isEmpty {
            data[index] = ""
        } else {
            if isEmpty {
                data[index - 1] = ""
            }
        }
        focusPreviousTextField(currentIndex: index)
    }

    private func focusPreviousTextField(currentIndex: Int) {
        let previousIndex = max(currentIndex - 1, 0)
        focusedTextField = previousIndex
    }

    func handleOnChangeAction() {
        lastIndex = data.lastIndex(where: { !$0.isEmpty }) ?? 0
        focusNextTextField(currentIndex: lastIndex)
        handleOnCompleteAction()
    }

    private func focusNextTextField(currentIndex: Int) {
        let nextIndex = min(currentIndex + 1, textFieldCount - 1)
        focusedTextField = nextIndex
    }

    private func handleOnCompleteAction() {
        if data.filter({ !$0.isEmpty }).count == textFieldCount {
            onCompleteCallback(data.joined(separator: ""))
        }
    }

    func getFocusedTextField() -> Int {
        let allDataIsEmpty = data.allSatisfy { $0.isEmpty }
        
        if allDataIsEmpty || isAllDataFull() {
            return allDataIsEmpty ? 0 : lastIndex
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
