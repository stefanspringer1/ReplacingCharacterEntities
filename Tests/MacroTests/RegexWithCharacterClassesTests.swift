import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest
import ReplacingCharacterEntitiesMacros
import ReplacingCharacterEntities

final class ReplacingCharacterEntitiesTests: XCTestCase {

    func test1() throws {
        // note that the type annotation is not necessary:
        let result: String = #ReplacingCharacterEntities("${auml}${alpha}")
        XCTAssertEqual(
            result,
            "äα"
        )
    }
    
}
