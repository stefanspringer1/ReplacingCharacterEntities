import Foundation

/// A macro to replace the character classes from [SwiftUtilities](https://github.com/stefanspringer1/SwiftUtilities) in the form `${MY_CHARACTER_CLASS}` in a regular expression text, returning a literal regular expression. (The dollar sign can be escaped using a backslash.) You will get a compiler error if you have chosen a non-existing character class.
///
/// To use this macro, you need to know how many groups are in the regular expression and choose the according macro name. If there are `<n>` groups, you will have to call the macro by `#ReplacingCharacterEntitiesAnd<n>Groups(...)`, e.g `#ReplacingCharacterEntitiesAnd2(...)` if there are two groups (exception: when having one group, you need to call `ReplacingCharacterEntitiesAnd1Group`). Currently, you can call the macro for up to seven groups. You will get a compiler error if you have chosen the wrong macro name.
///
/// Usage (note that the type annotation is not necessary):
///
/// ```swift
/// // note that the type annotation is not necessary:
/// let regex: Regex<Substring> = #ReplacingCharacterEntitiesAnd1Group("[${LATIN_LETTERS}]")
/// print("123 hello!".replacing(regex, with: "x")) // "123 xxxxx!"
/// ```
@freestanding(expression)
public macro replacingCharacterEntities(_ text: String) -> String = #externalMacro(module: "ReplacingCharacterEntitiesMacros", type: "ReplacingCharacterEntities")
