// swift-tools-version: 5.6
import PackageDescription


let package = Package(
    name: "EverythingAtOnce",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "EverythingAtOnce",
            targets: ["EverythingAtOnce"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "EverythingAtOnce",
            dependencies: []
        ),
        .testTarget(
            name: "everything-at-onceTests",
            dependencies: ["EverythingAtOnce"]
        ),
    ],
    swiftLanguageVersions: [
        .v5,
    ]
)
