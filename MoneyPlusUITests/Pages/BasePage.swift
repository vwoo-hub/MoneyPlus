

import Foundation
import XCTest

public class BasePage {
    typealias Completion = (() -> Void)?
    var app = XCUIApplication()
    let log = Logger().log
    
    var initialViews: [XCUIElement] {
        fatalError("Subclass should override rootElements")
    }
    
    init(app: XCUIApplication, timeout: TimeInterval = 5, completion: Completion = nil) {
        self.app = app
        log("waiting \(timeout)s for \(String(describing: self)) existence")
        
        XCTAssert(waitForAllRootElements(timeout: timeout),
                  "Page \(String(describing: self)) waited, but not loaded")
    }
    
    public func waitForAllRootElements(timeout: TimeInterval) -> Bool {
        let expectations = initialViews.map { element in
            let expectation = XCTNSPredicateExpectation(
                predicate: NSPredicate(format: "exists == true"),
                object: element
            )
            return expectation
        }
        
        let result = XCTWaiter().wait(for: expectations, timeout: timeout)
        
        if result != .completed {
            let missingElements = initialViews.filter { !$0.exists }
            missingElements.forEach { element in
                print("⚠️ Missing UI Element: \(element)")
            }
        }
        
        return result == .completed
    }
    
    @discardableResult
    public func hideKeyBoard() -> Self {
        app.keyboards.buttons["Return"].tap()
        return self
    }
}

class Logger {
    func log(_ mlog: String) {
        NSLog(mlog)
    }
}
