// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CLIAtlas",
    platforms: [
        // specify each minimum deployment requirement,
        //otherwise the platform default minimum is used.
       .macOS(.v10_14),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
		.package(url: "https://github.com/mongodb/mongo-swift-driver.git", from: "1.0.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "CLIAtlas",
            dependencies: [.product(name: "MongoSwiftSync", package: "mongo-swift-driver")]),
        .testTarget(
            name: "CLIAtlasTests",
            dependencies: ["CLIAtlas"]),
    ]
)
