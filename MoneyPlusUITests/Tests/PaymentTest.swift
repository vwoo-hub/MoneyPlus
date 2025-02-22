import Foundation
import XCTest

class PaymentTest: BaseTest {
    
    lazy var homePage = HomePage(app: app)
    lazy var paymentPage = PaymentPage(app: app)
    lazy var transactionDetailsPage = TransactionDetailsPage(app: app)
    
    func test_whenAddingIncome_thenShowNewTransaction() {
        let title = "Donations"
        let amount = "100.0"
        let date = "15/01/2025"
        
        homePage
            .deleteAllActivityCells()
            .tapAddButton()
        
        paymentPage
            .typeTitleTextField(title)
            .typeAmountTextField(amount)
            .typeDateTextField(date)
            .tapIncomeButton()
            .tapSaveButton()
        
        homePage
            .viewTransactionCell(title, "15 January 2025", "＋$100.0")
    }
    
    func test_whenAddingExepnse_thenShowNewTransaction() {
        let title = "Food from Taco Bell"
        let amount = "10.50"
        let date = "16/01/2025"
        
        homePage
            .deleteAllActivityCells()
            .tapAddButton()
        
        paymentPage
            .typeTitleTextField(title)
            .typeAmountTextField(amount)
            .typeDateTextField(date)
            .tapSaveButton()
        
        homePage
            .viewTransactionCell(title, "16 January 2025", "ー$10.5")
    }
    
    func test_whenAddingNewPayment_thenAddOptionalDetails() {
        let title = "Rent"
        let amount = "330.0"
        let date = "28/02/2025"
        let location = "Townsend Apartments"
        let detail = "i am poor"
        
        homePage
            .deleteAllActivityCells()
            .tapAddButton()
        
        paymentPage
            .typeTitleTextField(title)
            .typeAmountTextField(amount)
            .typeDateTextField(date)
            .typeLocationTextField(location)
            .typeDetailTextField(detail)
            .tapSaveButton()
        
        homePage
            .viewTransactionCell(title, "28 February 2025", "ー$330.0")
            .tapRecentActivityionCell()
        
        transactionDetailsPage
            .viewTransactionDetailLabels(title, date, "ー$330.0", location, detail)
    }
}
