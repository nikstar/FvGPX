// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ThGPX",
    platforms: [
        .macOS(.v10_12)
    ],
    products: [
        .library(
            name: "ThGPX",
            targets: ["ThGPX"]),
    ],
    dependencies: [
         .package(url: "https://github.com/drmohundro/SWXMLHash.git", from: "4.9.0")
    ],
    targets: [
        .target(
            name: "ThGPX",
            dependencies: ["SWXMLHash"]),
        .testTarget(
            name: "ThGPXTests",
            dependencies: ["ThGPX"]),
    ]
)
