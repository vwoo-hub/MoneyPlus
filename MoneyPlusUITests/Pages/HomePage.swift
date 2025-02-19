
import Foundation
import XCTest

public class HomePage: BasePage {
    
    private struct Constants {
        static let titelLabel = "Personal Finance"
        static let totalBalanceLabel = "Total Balance"
        static let totalBalanceValueLabel = ""
        static let incomeLabel = "Income"
        static let incomeValueLabel = ""
        static let expenseLabel = "Expense"
        static let expenseValueLabel = ""
        static let recentTransactionsLabel = "Recent Transactions"
    }
    
    override var initialViews: [XCUIElement] {
        return [
            app.staticTexts[Constants.titelLabel],
            app.staticTexts[Constants.totalBalanceLabel],
            app.staticTexts[Constants.incomeLabel],
            app.staticTexts[Constants.expenseLabel],
            app.staticTexts[Constants.recentTransactionsLabel]
        ]
    }

    @discardableResult
    func tapAddButton(completion: Completion = nil) -> Self {
        log("tap Add button")
        app.buttons["add_button"].tap()
        return self
    }
}
