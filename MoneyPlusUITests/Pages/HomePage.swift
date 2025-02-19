
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
    
    private enum Activity {
        static let activityLabel = "activity_label"
        static let activityDateLabel = "activity_date_label"
        static let activityCostLabel = "activity_cost_label"
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
    
    @discardableResult
    func viewActivityLabels(completion: Completion = nil,  _ title: String, _ date: String, _ cost: String) -> Self {
//        XCTAssertEqual(app.staticTexts[Activity.activityLabel].label, title)
//        XCTAssertEqual(app.staticTexts[Activity.activityDateLabel].label, date)
//        XCTAssertEqual(app.staticTexts[Activity.activityCostLabel].label, cost)

        XCTAssertTrue(app.staticTexts[title].exists)
        XCTAssertTrue(app.staticTexts[date].exists)
        XCTAssertTrue(app.staticTexts[cost].exists)
        return self
    }
}
