// swift-tools-version: 5.7
import PackageDescription

// MARK: - Package

let package = Package(
	name: "EverythingAtOnce",
	platforms: [
		.iOS(.v13)
	],
	products: [
		.library(
			name: "EverythingAtOnce",
			targets: ["EverythingAtOnce"]
		)
	],
	dependencies: [],
	targets: [
		.target(
			name: "EverythingAtOnce",
			dependencies: []
		),
		.testTarget(
			name: "EverythingAtOnceTests",
			dependencies: ["EverythingAtOnce"]
		)
	]
)
