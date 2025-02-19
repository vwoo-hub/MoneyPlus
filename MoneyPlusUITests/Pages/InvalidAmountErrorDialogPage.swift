
import Foundation
import XCTest

public class InvalidAmountErrorDialogPage: BasePage {
    
    override var rootElement: XCUIElement {
        return app.staticTexts["Oops"]
    }

    @discardableResult
    func tapOkButton(completion: Completion = nil) -> Self {
        log("tap ok button")
        app.buttons["OK"].tap()
        return self
    }
}
