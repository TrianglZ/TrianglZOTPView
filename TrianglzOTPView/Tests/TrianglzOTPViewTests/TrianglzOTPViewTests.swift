import XCTest
import SwiftUI
@testable import TrianglzOTPView

final class TrianglzOTPViewTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
//        XCTAssertEqual(TrianglzOTPView().text, "Hello, World!")
        
        var otpValue: String = ""
        let isAllDataEnteredBinding = Binding<Bool>.constant(false)

        let view = TrianglzOTPView(textFieldCount: 4,
                                   customStyle: CustomStyle(foregroundColor: .blue,
                                                            fontStyle: .largeTitle,
                                                            vstackSpacing: 10),
                                   isAllDataEntered: isAllDataEnteredBinding,
                                   onCompleteCallback: { otp in
                                       otpValue = otp
                                       debugPrint(otpValue, "value received")
                                   })

        DispatchQueue.main.async {
            self.enterTextIntoTextFields(view: view)
        }
        
        XCTAssertEqual(otpValue, "1234")
    }

    private func enterTextIntoTextFields(view: TrianglzOTPView) {
        for index in 0..<view.textFieldCount {
            let textField = view.data.indices[index]
            view.data[textField] = "\(index + 1)"
            view.onChangeCallback?()
        }
    }
}
