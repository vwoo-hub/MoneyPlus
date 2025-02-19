import Foundation
import XCTest

class BaseTest: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        app = XCUIApplication()
        print("Launching the app...")
        app.launch()
        print("App launched successfully")
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
