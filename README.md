# ReplacingCharacterEntities

A macro to replace the usual character entities (cf. [SwiftUtilities](https://github.com/stefanspringer1/SwiftUtilities)) in the (XML notation) form `&MY_CHARACTER_ENTITY;`, returning the according text. (The ampersand can be escaped using a backslash, this escapement will be removed by ths macro.) You will get a compiler error if you have chosen a non-existing entity name.

Usage (note that the type annotation is not necessary):

```swift// note that the type annotation is not necessary:
let result: String = #replacingCharacterEntities(#"&auml;&alpha;\&alpha;"#)
print(result) // "äα"
```
