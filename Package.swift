// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "cothon",
    platforms: [
        .macOS(.v10_12)
    ],
    products: [
        .library(
            name: "cothon",
            targets: ["cothon"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMinor(from: "0.4.0")),
        .package(name: "SwiftSyntax", url: "https://github.com/apple/swift-syntax.git", .exact("0.50400.0")),
    ],
    targets: [
        .target(
            name: "cothon",
            dependencies: [
                "SwiftSyntax",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .testTarget(
            name: "cothonTests",
            dependencies: ["cothon"]
        ),
    ]
)
