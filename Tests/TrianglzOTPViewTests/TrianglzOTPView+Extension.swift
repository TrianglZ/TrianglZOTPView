//
//  TrianglzOTPView+Extension.swift
//  
//
//  Created by Nour Gweda on 09/11/2023.
//

import XCTest
import SwiftUI
@testable import TrianglzOTPView

final class TrianglzOTPViewExtensionTests: XCTestCase {

    var otpView = TrianglzOTPView(
        textFieldCount: 10,
        customStyle: TrianglzOTPView.Style(foregroundColor: .gray,
                                           fontStyle: .systemFont(ofSize: 18),
                                           hstackSpacing: 10,
                                           hstackAlignment: .center,
                                           borderColor: .gray,
                                           width: 50,
                                           height: 50,
                                           backgroundColor: .clear,
                                           cornerRadius: 10,
                                           borderWidth: 1,
                                           shadowColor: .clear,
                                           shadowRadius: 0,
                                           shadowXOffset: 0,
                                           shadowYOffset: 0,
                                           isCursorHidden: true),
        onChangeCallback: { _ in },
        onCompleteCallback: { _ in },
        shouldDismissKeyboard: Binding<Bool>(projectedValue: .constant(false)))

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
    }

    func test_setUpData_with_negative_number() {
        //
        otpView.textFieldCount = -5
        otpView.setUpData()
        XCTAssertEqual(otpView.data.count, 0, "Can't construct Array with count < 0")
    }

    func test_setUpData_with_empty_array() {
        otpView.textFieldCount = 0
        otpView.setUpData()
        XCTAssertEqual(otpView.data.count, 0, "Can't construct Empty array")
    }

    func test_setUpData_with_positive_numbers() {
        otpView.textFieldCount = 10
        otpView.setUpData()
        //
        XCTAssertEqual(otpView.data.count, 10, "Success! array created")
    }

    func test_handleOnBackAction_not_empty_index() {
        let index = 2
        otpView.data = ["1", "2", "3", "4", "5"]
        otpView.handleOnBackAction(isEmpty: otpView.data[index].isEmpty, index: index)
        XCTAssertEqual(otpView.data[index], "")
    }
}
