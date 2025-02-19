import Foundation
import XCTest

class ErrorValidationTest: BaseTest {
    
    lazy var homePage = HomePage(app: app)
    lazy var paymentPage = PaymentPage(app: app)
    lazy var invalidAmountErrorDialogPage = InvalidAmountErrorDialogPage(app: app)
    lazy var invalidTitleErrorDialogPage = InvalidTitleErrorDialogPage(app: app)
    lazy var invalidDateErrorDialogPage = InvalidDateErrorDialogPage(app:app)
    
    func test_whenInvalidTitle_thenDisplayErrorMessage() {
        homePage
            .tapAddButton()
        
        paymentPage
            .tapSaveButton()
        
        invalidTitleErrorDialogPage
            .tapOkButton()
        
        XCTAssertTrue(paymentPage.initialViews.allSatisfy({ $0.exists }))
    }
    
    func test_whenInvalidPayment_thenDisplayErrorMessage() {
        homePage
            .tapAddButton()
        
        paymentPage
            .typeTitleTextField("test payment")
            .typeAmountTextField("invalid amount")
            .tapSaveButton()
        
        invalidAmountErrorDialogPage
            .tapOkButton()
        
        XCTAssertTrue(paymentPage.initialViews.allSatisfy({ $0.exists }))
    }
    
    func test_whenInvalidDate_thenDisplayErrorMessage() {
        homePage
            .tapAddButton()
        
        paymentPage
            .typeTitleTextField("test payment")
            .typeDateTextField("Invalid date")
            .tapSaveButton()
        
        invalidDateErrorDialogPage
            .tapOkButton()
        
        XCTAssertTrue(paymentPage.initialViews.allSatisfy({ $0.exists }))
    }
}
