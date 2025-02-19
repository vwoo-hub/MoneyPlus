

import Foundation
import XCTest

public class BasePage {
    typealias Completion = (() -> Void)?
    var app = XCUIApplication()
    let log = Logger().log
    init(app: XCUIApplication, timeout: TimeInterval = 5, completion: Completion = nil) {
        self.app = app  // Use existing app instance
        log("waiting \(timeout)s for \(String(describing: self)) existence")
        
        
        XCTAssert(waitForAllRootElements(timeout: timeout),
                  "Page \(String(describing: self)) waited, but not loaded")
    }
    
    private func waitForAllRootElements(timeout: TimeInterval) -> Bool {
        let startTime = Date()
        
        while Date().timeIntervalSince(startTime) < timeout {
            // Check if all elements exist
            if initialViews.allSatisfy({ $0.exists }) {
                return true
            }
            usleep(250_000) // Sleep for 250ms before checking again
        }
        
        return false
    }
    
    var initialViews: [XCUIElement] {
        fatalError("Subclass should override rootElements")
    }
}

class Logger {
    func log(_ mlog: String) {
        NSLog(mlog)
    }
}
