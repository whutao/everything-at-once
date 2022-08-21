// swift-tools-version: 5.6
import PackageDescription


let package = Package(
    name: "EverythingAtOnce",
    platforms: [
        .iOS(.v13), .macOS(.v10_15)
    ],
    products: [
        .library(name: "EverythingAtOnce", targets: ["EverythingAtOnce"]),
        .library(name: "EOSwift", targets: ["EOSwift"]),
        .library(name: "EOFoundation", targets: ["EOFoundation"]),
        .library(name: "EOConcurrency", targets: ["EOConcurrency"]),
        .library(name: "EOCombine", targets: ["EOCombine"]),
        .library(name: "EOCoreGraphics", targets: ["EOCoreGraphics"]),
        .library(name: "EOPropertyWrapper", targets: ["EOPropertyWrapper"]),
        .library(name: "EOUtils", targets: ["EOUtils"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "EOSwift", dependencies: []),
        .target(name: "EOFoundation", dependencies: ["EOSwift"]),
        .target(name: "EOCombine", dependencies: ["EOSwift", "EOFoundation"]),
        .target(name: "EOCoreGraphics", dependencies: []),
        .target(name: "EOPropertyWrapper", dependencies: ["EOConcurrency"]),
        .target(name: "EOUtils", dependencies: ["EOSwift", "EOFoundation"]),
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
            ]
        ),
        .testTarget(
            name: "EverythingAtOnceTests",
            dependencies: ["EverythingAtOnce"]
        ),
    ]
)
