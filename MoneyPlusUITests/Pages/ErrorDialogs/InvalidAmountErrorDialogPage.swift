import Foundation
import XCTest


public class InvalidAmountErrorDialogPage: BasePage {
    
    private struct Constants {
        static let titelLabel = "Oops"
        static let subtitleLabel = "Please enter a valid amount~"
        static let okButton = "OK"
    }
    
    override var initialViews: [XCUIElement] {
        return [
            app.staticTexts[Constants.titelLabel],
            app.staticTexts[Constants.subtitleLabel],
            app.buttons[Constants.okButton]
        ]
    }

    @discardableResult
    func tapOkButton(completion: Completion = nil) -> Self {
        log("tap ok button")
        app.buttons["OK"].tap()
        return self
    }
}

