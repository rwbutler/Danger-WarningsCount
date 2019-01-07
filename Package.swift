// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "DangerWarningsCount",
    products: [
        .library(
            name: "DangerWarningsCount",
            targets: ["DangerWarningsCount"])
    ],
    dependencies: [
        .package(url: "https://github.com/danger/danger-swift.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "DangerWarningsCount",
            dependencies: ["Danger"],
            path: "Sources/DangerWarningsCount"),
        .testTarget(
            name: "DangerWarningsCountTests",
            dependencies: ["DangerWarningsCount"])
    ]
)