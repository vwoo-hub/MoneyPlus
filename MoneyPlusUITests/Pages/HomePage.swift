
import Foundation
import XCTest

public class HomePage: BasePage {
    override var rootElement: XCUIElement {
        return app.staticTexts["Personal Finance"]
    }

    @discardableResult
    func tapAddButton(completion: Completion = nil) -> Self {
        log("tap Add button")
        app.buttons["add_button"].tap()
        return self
    }
}
