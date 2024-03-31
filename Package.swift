// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TestLib",
    platforms: [
      .macOS(.v14),
      .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "TestLib",
            targets: ["TestLib"]),
    ],
    dependencies: [
      .package(
        url: "https://github.com/pointfreeco/swift-composable-architecture",
        from: "1.0.0"
      )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "TestLib",
            dependencies: [
              .product(
                name: "ComposableArchitecture",
                package: "swift-composable-architecture"
              )
            ]
        ),
        .testTarget(
            name: "TestLibTests",
            dependencies: ["TestLib"]),
    ]
)
