
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
        static let deleteButton = "trash"
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
        log("verify activity labels")
        XCTAssertTrue(app.staticTexts[title].exists)
        XCTAssertTrue(app.staticTexts[date].exists)
        XCTAssertTrue(app.staticTexts[cost].exists)
        return self
    }
    
    @discardableResult
    func deleteActivityCell(completion: Completion = nil) -> Self {
        let activityCell = app.staticTexts[Activity.activityLabel]
        log("deleting activity cell")
        
        if activityCell.waitForExistence(timeout: 2) {
            activityCell.swipeRight()
            
            let deleteButton = app.buttons[Activity.deleteButton]
            let deleteButtonVisible = deleteButton.waitForExistence(timeout: 2)
            
            XCTAssertTrue(deleteButtonVisible, "Delete button did not appear after swiping")
            
            if deleteButtonVisible {
                deleteButton.tap()
                log("Delete button tapped successfully.")
            } 
            else {
                log("Delete button did not appear.")
            }
        } 
        else {
            log("Activity cell not found, skipping swipe")
        }
        
        return self
    }
    
    @discardableResult
    func deleteAllActivityCells(completion: Completion = nil) -> Self {
        log("delete all activity cells")

        let activityCell = app.staticTexts[Activity.activityLabel].firstMatch
        
        while activityCell.waitForExistence(timeout: 2) {
            activityCell.swipeRight()

            let deleteButton = app.buttons["trash"]
            let deleteButtonVisible = deleteButton.waitForExistence(timeout: 3)

            XCTAssertTrue(deleteButtonVisible, "Delete button did not appear after swiping")

            if deleteButtonVisible {
                deleteButton.tap()
                log("Delete button tapped successfully.")
            }
            else {
                log("Delete button did not appear.")
                break
            }
        }
        
        return self
    }
}
