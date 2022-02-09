import XCTest
import ViewInspector
@testable import ThemedButton

extension ThemedButton: Inspectable {}

final class ThemedButtonTests: XCTestCase {
    func testButtonUppercasesText() throws {
        let btn = ThemedButton(text: "Press Me!") {
            print("Pressed!")
        }

        XCTAssertNotNil(try btn.inspect().find(text: "PRESS ME!" ))
    }
}
