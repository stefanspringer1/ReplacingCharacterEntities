# ReplacingCharacterEntities

A macro to replace the usal character entities (cf. [SwiftUtilities](https://github.com/stefanspringer1/SwiftUtilities)) in the form `${MY_CHARACTER_ENTITY}`, returning the according text. (The dollar sign can be escaped using a backslash.) You will get a compiler error if you have chosen a non-existing entity name.

Usage (note that the type annotation is not necessary):

```swift// note that the type annotation is not necessary:
let result: String = #ReplacingCharacterEntities("${auml}${alpha}")
print(result) // "äα"
```
