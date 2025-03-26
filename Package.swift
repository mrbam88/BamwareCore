// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "BamwareCore",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "BamwareCore", targets: ["BamwareCore"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BamwareCore",
            dependencies: []
        ),
        .testTarget(
            name: "BamwareCoreTests",
            dependencies: ["BamwareCore"]
        )
    ]
)
