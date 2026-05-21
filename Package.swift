// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "WelcomeScreen",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "WelcomeScreen",
            targets: ["WelcomeScreen"]
        )
    ],
    targets: [
        .target(
            name: "WelcomeScreen",
            dependencies: [],
            resources: [
                .process("Resources")
            ]
        )
    ]
)
