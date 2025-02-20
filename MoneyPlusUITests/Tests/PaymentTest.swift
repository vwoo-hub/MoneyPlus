import Foundation
import XCTest

class PaymentTest: BaseTest {
    
    lazy var homePage = HomePage(app: app)
    lazy var paymentPage = PaymentPage(app: app)
    
    func test_whenAddingIncome_thenShowNewTransaction() {
        let title = "Food from Taco Bell"
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
            .viewActivityLabels(title, "15 January 2025", "＋$100.0")
    }
}
