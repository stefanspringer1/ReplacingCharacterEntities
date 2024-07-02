import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest
import ReplacingCharacterEntitiesMacros
import ReplacingCharacterEntities

final class ReplacingCharacterEntitiesTests: XCTestCase {

    func test1() throws {
        // note that the type annotation is not necessary:
        let result: String = #replacingCharacterEntities(#"&auml;&alpha;\&alpha;"#)
        XCTAssertEqual(
            result,
            "äα&alpha;"
        )
    }
    
}
