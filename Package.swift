// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "BamwareCore",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "BamwareCore", targets: ["BamwareCore"])
    ],
    targets: [
        .target(name: "BamwareCore"),
        .testTarget(name: "BamwareCoreTests", dependencies: ["BamwareCore"])
    ]
)
