import Foundation
import XCTest

public class NewPaymentPage: BasePage {
    
    private struct Constants {
        static let newPaymentLabel = "New Payment"
        static let titleTextField = "title_field"
        static let amountTextField = "amount_field"
        static let saveButton = "save_button"
    }

    override var initialViews: [XCUIElement] {
        return [
            app.staticTexts[Constants.newPaymentLabel],
            app.textFields[Constants.titleTextField],
            app.textFields[Constants.amountTextField],
            app.buttons[Constants.saveButton]
        ]
    }

    @discardableResult
    func typeTitleTextfield(completion: Completion = nil, _ title: String) -> Self {
        log("type title textfield")
        app.textFields[Constants.titleTextField].typeText(title)
        return self
    }
    
    @discardableResult
    func typeAmountTextfield(completion: Completion = nil, _ amount: String) -> Self {
        log("type amount textfield")
        app.textFields[Constants.amountTextField].tap()
        app.textFields[Constants.amountTextField].typeText(amount)
        return self
    }
    
    @discardableResult
    func tapSaveButton(completion: Completion = nil) -> Self {
        log("tap save button")
        app.buttons[Constants.saveButton].tap()
        return self
    }
}
