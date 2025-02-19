import XCTest

extension XCUIElement {
    
    public func clearAndEnterText(_ text: String) {
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non-string value.")
            return
        }

        self.doubleTap()

        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)

        self.typeText(deleteString)
        self.typeText(text)
    }
    
    public func swipeToElement(element: XCUIElement, _ maxScrolls: Int = 10) {
        for _ in 0..<maxScrolls {
            if elementInView(element: element) { break }
            self.swipeUp(velocity: 333)
        }
    }

    private func elementInView(element: XCUIElement) -> Bool {
        guard element.exists && element.isHittable else { return false }
        return true
    }
}
