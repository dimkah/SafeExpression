// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SafeExpression",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "SafeExpression",
            targets: ["SafeExpression"]
        ),
    ],
    targets: [
        .target(
            name: "SafeExpressionObjC",
            publicHeadersPath: "."
        ),
        .target(
            name: "SafeExpression",
            dependencies: ["SafeExpressionObjC"]
        ),
        .testTarget(
            name: "SafeExpressionTests",
            dependencies: ["SafeExpression"]
        )
    ]
)
