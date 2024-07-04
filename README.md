# TrianglZOTPView
[![Language: Swift 5](https://img.shields.io/badge/language-swift5-f48041.svg?style=flat)](https://developer.apple.com/swift) ![Platform: iOS 15+](https://img.shields.io/badge/platform-iOS%2015%2B-blue.svg?style=flat) [![SPM compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://swift.org/package-manager/) ![Version: 1.0.0](https://img.shields.io/badge/%20version-1.0.0-green)

OTP View with SMS Auto-Fill is a versatile user interface component designed to simplify and secure user authentication processes. It combines manual keyboard input for OTP entry with intelligent SMS detection and auto-fill functionality. Enhance your applications with this feature-rich component to provide users with a seamless, error-reducing, and convenient OTP verification experience. Boost security and user satisfaction effortlessly.

# Key Features:
- Keyboard input for OTP entry.
- Automatic OTP detection and population from SMS.
- SwiftUI support.

# Enhancement points
- [ ] Focus based on fill state

# Getting Started
  - [Installation](#installation)
  - [TrianglZOTPView 101](#trianglZOTPView-101)
    - [Customization](#customization)
    - [Callbacks](#callbacks)
    - [Dismissing the Keyboard](#dismissing-the-Keyboard)
  - [License](#license)
  - [Acknowledgments](#acknowledgments)
 

# Installation
___
`TrianglZOTPView`  is installed via the official [Swift Package Manager](https://swift.org/package-manager/).  
Select `Xcode`>`File`> `Swift Packages`>`Add Package Dependency...`  
and add `https://github.com/TrianglZ/TrianglZOTPView`.

# TrianglZOTPView 101
___
Once you've added TrianglzOTPView to your project, you can use it in your SwiftUI views as follows:
```swift
import SwiftUI
import TrianglzOTPView

struct ContentView: View {
    
    // Define your custom style for the OTP view
    let customStyle = Style(
        // Customize the appearance here
    )
	// Define input Type 
	let inputType: TrianglzOTPInputType = digits /* digits or digitsAndAlphabets */
    // Create a binding variable to dismiss the keyboard
    @State private var shouldDismissKeyboard = false
    
    // Define your callback for OTP completion
    func onOTPComplete(_ otp: String) {
        // Handle OTP completion here
        print("OTP Entered: \(otp)")
    }
    
    var body: some View {
        TrianglzOTPView(
            textFieldCount: 6, // Specify the number of OTP digits
            customStyle: customStyle,
			inputType: TrianglzOTPInputType,
            onCompleteCallback: onOTPComplete,
            shouldDismissKeyboard: $shouldDismissKeyboard
        )
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
#### Customization
You can customize the appearance of the OTP view by adjusting the Style struct passed to TrianglzOTPView. Customize fonts, colors, spacing, and more to match your app's design.
```swift
    TrianglzOTPView.Style(foregroundColor: Color,
                                  fontStyle: UIFont,
                                  hstackSpacing: CGFloat,
                                  hstackAlignment: VerticalAlignment,
                                  borderColor: Color, 
                                  width: CGFloat,
                                  height: CGFloat,
                                  backgroundColor: Color,
                                  cornerRadius: CGFloat,
                                  borderWidth: CGFloat,
                                  shadowColor: Color,
                                  shadowRadius: CGFloat,
                                  shadowXOffset: CGFloat,
                                  shadowYOffset: CGFloat,
                                  isCursorHidden: Bool,
								  focusedStateColor: Color? = nil)
```
#### Callbacks
TrianglzOTPView provides two callbacks:
- onChangeCallback: optional callback Called whenever the OTP input changes.
- onCompleteCallback: Called when the user completes OTP entry (e.g., after entering all digits).

#### Dismissing the Keyboard
Set the shouldDismissKeyboard binding variable to true to dismiss the keyboard.

# License
This project is licensed under the MIT License License - see the [LICENSE](https://github.com/TrianglZ/TrianglZOTPView/blob/main/LICENSE) file for details.

# Acknowledgments
Thank you for using TrianglzOTPView! Contributions and feedback are welcome. If you encounter issues or have suggestions for improvements, please open an issue or submit a pull request on the GitHub repository.
