// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "ListKit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v8),
        .macOS(.v12),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "ListKit",
            targets: ["ListKit"]
        ),
    ],
    targets: [
        .target(
            name: "ListKit"
        ),
        .testTarget(
            name: "ListKitTests",
            dependencies: ["ListKit"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
