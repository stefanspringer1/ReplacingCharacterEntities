import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import Foundation
import Utilities

extension String: Error {}

let characterClasses = CharacterClasses()

public struct ReplacingCharacterEntities: ExpressionMacro {
    public static func expansion<Node: FreestandingMacroExpansionSyntax,
                                 Context: MacroExpansionContext>(of node: Node,
                                                                 in context: Context) throws -> ExprSyntax {
        
        guard
            /// 1. Grab the first (and only) Macro argument.
            let argument = node.argumentList.first?.expression,
            /// 2. Ensure the argument contains of a single String literal segment.
            let segments = argument.as(StringLiteralExprSyntax.self)?.segments,
            segments.count == 1,
            /// 3. Grab the actual String literal segment.
            case .stringSegment(let literalSegment)? = segments.first
        else {
            throw "macro requires static string literal"
        }
        
        var text = literalSegment.content.text
        
        text = try text.replacingCharacterEntitiesWithString()
        
        let expr: ExprSyntax = "\"\(raw: text)\""
        return ExprSyntax(expr)

    }
}
