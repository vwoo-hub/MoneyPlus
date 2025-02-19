import Foundation
import XCTest

class ErrorValidationTest: BaseTest {
    
    lazy var homePage = HomePage(app: app)
    lazy var newPaymentPage = NewPaymentPage(app: app)
    lazy var invalidAmountErrorDialogPage = InvalidAmountErrorDialogPage(app: app)
    lazy var invalidTitleErrorDialogPage = InvalidTitleErrorDialogPage(app: app)
    
    func test_whenInvalidTitle_thenDisplayErrorMessage() {
        homePage
            .tapAddButton()
        
        newPaymentPage
            .tapSaveButton()
        
        invalidTitleErrorDialogPage
            .tapOkButton()
    }
    
    func test_whenInvalidPayment_thenDisplayErrorMessage() {
        homePage
            .tapAddButton()
        
        newPaymentPage
            .typeTitleTextfield("test payment")
            .typeAmountTextfield("aaa")
            .tapSaveButton()
        
        invalidAmountErrorDialogPage
            .tapOkButton()
    }
}
