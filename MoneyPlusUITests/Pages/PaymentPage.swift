import Foundation
import XCTest

public class PaymentPage: BasePage {
    
    private struct Constants {
        static let newPaymentLabel = "New Payment"
        static let titleTextField = "title_field"
        static let amountTextField = "amount_field"
        static let dateTextField = "date_field"
        static let incomeButton = "INCOME"
        static let expenseButton = "EXPENSE"
        static let locationTextField = "location_field"
        static let detailTextField = "detail_field"
        static let saveButton = "save_button"
    }

    override var initialViews: [XCUIElement] {
        return [
            app.staticTexts[Constants.newPaymentLabel],
            app.textFields[Constants.titleTextField],
            app.textFields[Constants.amountTextField],
            app.buttons[Constants.incomeButton],
            app.buttons[Constants.expenseButton],
            app.textFields[Constants.locationTextField],
            app.textFields[Constants.detailTextField],
            app.buttons[Constants.saveButton]
        ]
    }

    @discardableResult
    func typeTitleTextField(completion: Completion = nil, _ title: String) -> Self {
        log("type title textfield")
        app.textFields[Constants.titleTextField].typeText(title)
        return self
    }
    
    @discardableResult
    func typeAmountTextField(completion: Completion = nil, _ amount: String) -> Self {
        log("type amount textfield")
        app.textFields[Constants.amountTextField].clearAndEnterText(amount)
        return self
    }
    
    @discardableResult
    func typeDateTextField(completion: Completion = nil, _ date: String) -> Self {
        log("type amount textfield")
        app.textFields[Constants.dateTextField].clearAndEnterText(date)
        return self
    }
    
    @discardableResult
    func tapIncomeButton(completion: Completion = nil) -> Self {
        log("tap income button")
        app.buttons[Constants.incomeButton].tap()
        return self
    }
    
    @discardableResult
    func tapExpenseButton(completion: Completion = nil) -> Self {
        log("tap expense button")
        app.buttons[Constants.expenseButton].tap()
        return self
    }
    
    @discardableResult
    func typeLocationTextField(completion: Completion = nil, _ location: String) -> Self {
        log("type location textfield")
        app.textFields[Constants.locationTextField].tap()
        app.textFields[Constants.locationTextField].typeText(location)
        return self
    }
    
    @discardableResult
    func typeDetailTextField(completion: Completion = nil, _ detail: String) -> Self {
        log("type detail textfield")
        app.textFields[Constants.detailTextField].tap()
        app.textFields[Constants.detailTextField].typeText(detail)
        return self
    }
    
    @discardableResult
    func tapSaveButton(completion: Completion = nil) -> Self {
        log("tap save button")
        app.buttons[Constants.saveButton].tap()
        return self
    }
}
