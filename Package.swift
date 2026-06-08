// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "ListKit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17),
        .tvOS(.v17),
        .watchOS(.v10),
        .macOS(.v14),
        .visionOS(.v2)
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
