// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GPX.swift",
    platforms: [.iOS(.v10), .macOS(.v10_12)],
    products: [
        .library(name: "GPX", targets: ["GPX"]),
    ],
    dependencies: [
         .package(url: "https://github.com/drmohundro/SWXMLHash.git", from: "4.9.0")
    ],
    targets: [
        .target(name: "GPX", dependencies: ["SWXMLHash"]),
        .testTarget(name: "GPXTests", dependencies: ["GPX"]),
    ]
)
