import XCTest

class HomeTest: BaseTest {
    lazy var homePage = HomePage(app: app)
    lazy var paymentPage = PaymentPage(app: app)
    lazy var transactionDetailsPage = TransactionDetailsPage(app: app)
    
    let title = "Boba"
    let amount = "7.0"
    let date = "14/02/2025"
    
    func test_whenSwipeOnTransaction_thenDeleteTransaction() {

        
        homePage
            .deleteAllActivityCells()
            .tapAddButton()
        
        paymentPage
            .typeTitleTextField(title)
            .typeAmountTextField(amount)
            .typeDateTextField(date)
            .tapSaveButton()
        
        homePage
            .viewTransactionCell(title, "14 February 2025", "ー$7.0")
            .deleteActivityCell()
    }
    
    func test_whenTapOnTransaction_thenShowsTransactionDetails() {
        homePage
            .deleteAllActivityCells()
            .tapAddButton()
        
        paymentPage
            .typeTitleTextField(title)
            .typeAmountTextField(amount)
            .typeDateTextField(date)
            .tapSaveButton()
        
        homePage
            .viewTransactionCell(title, "14 February 2025", "ー$7.0")
            .tapRecentActivityionCell()
    
        XCTAssertTrue(transactionDetailsPage.initialViews.allSatisfy({ $0.exists }))
    }
}
