// swift-tools-version: 5.6
import PackageDescription


let package = Package(
    name: "EverythingAtOnce",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(name: "EverythingAtOnce", targets: ["EverythingAtOnce"]),
        .library(name: "EOSwift", targets: ["EOSwift"]),
        .library(name: "EOFoundation", targets: ["EOFoundation"]),
        .library(name: "EOCoreGraphics", targets: ["EOCoreGraphics"]),
        .library(name: "EOPropertyWrapper", targets: ["EOPropertyWrapper"]),
        .library(name: "EOUtils", targets: ["EOUtils"]),
        .library(name: "EOConcurrency", targets: ["EOConcurrency"]),
        .library(name: "EOCoreAnimation", targets: ["EOCoreAnimation"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "EOSwift", dependencies: []),
        .target(name: "EOFoundation", dependencies: ["EOSwift"]),
        .target(name: "EOCoreGraphics", dependencies: []),
        .target(name: "EOPropertyWrapper", dependencies: []),
        .target(name: "EOUtils", dependencies: ["EOSwift"]),
        .target(name: "EOCoreAnimation", dependencies: []),
        .target(name: "EOConcurrency", dependencies: []),
        .target(
            name: "EverythingAtOnce",
            dependencies: [
                "EOSwift",
                "EOFoundation",
                "EOCoreGraphics",
                "EOPropertyWrapper",
                "EOUtils",
                "EOConcurrency",
                "EOCoreAnimation"
            ]
        ),
        .testTarget(
            name: "EverythingAtOnceTests",
            dependencies: ["EverythingAtOnce"]
        ),
    ],
    swiftLanguageVersions: [
        .v5,
    ]
)
