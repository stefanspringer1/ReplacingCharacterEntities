// swift-tools-version: 5.9

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "ReplacingCharacterEntities",
    platforms: [.macOS(.v13), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        .library(
            name: "ReplacingCharacterEntities",
            targets: ["ReplacingCharacterEntities"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0"),
        .package(url: "https://github.com/stefanspringer1/SwiftUtilities.git", from: "0.1.36"),
    ],
    targets: [
        .macro(
            name: "ReplacingCharacterEntitiesMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
                .product(name: "Utilities", package: "SwiftUtilities"),
            ]
        ),
        .target(
            name: "ReplacingCharacterEntities",
            dependencies: ["ReplacingCharacterEntitiesMacros"]
        ),
        .testTarget(
            name: "MacroTests",
            dependencies: [
                "ReplacingCharacterEntitiesMacros",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        ),
    ]
)
