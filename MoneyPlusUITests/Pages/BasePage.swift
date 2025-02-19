

import Foundation
import XCTest

public class BasePage {
    typealias Completion = (() -> Void)?
    var app = XCUIApplication()
    let log = Logger().log
    init(app: XCUIApplication, timeout: TimeInterval = 5, completion: Completion = nil) {
        self.app = app  // Use existing app instance
        log("waiting \(timeout)s for \(String(describing: self)) existence")
        XCTAssert(rootElement.waitForExistence(timeout: timeout),
                  "Page \(String(describing: self)) waited, but not loaded")
    }
    
    var rootElement: XCUIElement {
        fatalError("subclass should override rootElements")
    }
}

class Logger {
    func log(_ mlog: String) {
        NSLog(mlog)
    }
}
