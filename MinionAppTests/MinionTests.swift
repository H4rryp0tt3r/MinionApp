import XCTest
@testable import MinionApp

class MinionTests: XCTestCase {

    func testShouldValidateEquatability() {
        let minion = Minion(name: "Harry")
        let minion2 = Minion(name: "Potter")
        let minion3 = Minion(name: "Harry")

        XCTAssertEqual(minion, minion)
        XCTAssertEqual(minion, minion3)
        XCTAssertNotEqual(minion, minion2)
    }
}
