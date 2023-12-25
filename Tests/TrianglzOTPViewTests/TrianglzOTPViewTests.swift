import XCTest
import SwiftUI
@testable import TrianglzOTPView

final class TrianglzOTPViewTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        func testDismissKeyboard() {
            // Create a binding for shouldDismissKeyboard
            var shouldDismissKeyboard = false

            // Create an instance of OTPMainView with the binding
            let otpMainView = TrianglzOTPView(
                textFieldCount: 6,
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
                shouldDismissKeyboard: Binding<Bool>(
                    get: { shouldDismissKeyboard },
                    set: { shouldDismissKeyboard = $0 }
                )
            )
            // Simulate the binding change to dismiss the keyboard
            _ = otpMainView.onChange(of: shouldDismissKeyboard, perform: { newValue in
                if newValue {
                    otpMainView.focusedTextField = nil
                }
            })

            // Verify that the focusedTextField is nil when shouldDismissKeyboard is true
            otpMainView.focusedTextField = 0
            XCTAssert(otpMainView.focusedTextField == 0)
            shouldDismissKeyboard = true
            XCTAssert(otpMainView.focusedTextField == nil)
        }

    }
}
