// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "EasyPrefence",
    products: [
        .library(
            name: "EasyPrefence",
            targets: ["EasyPrefence"]
        ),
        .library(
            name: "EasyUserDefaultPreference",
            targets: ["EasyUserDefaultPreference"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/EasyPackages/EasyMock.git",
            from: "1.0.0"
        ),
        .package(path: "../EasyTesting")
    ],
    targets: [
        .target(name: "EasyPrefence"),
        
        .target(
            name: "EasyUserDefaultPreference",
            dependencies: ["EasyPrefence"]
        ),
        .testTarget(
            name: "EasyUserDefaultPreferenceTests",
            dependencies: [
                "EasyUserDefaultPreference",
                "EasyMock",
                "EasyTesting"
            ]
        ),
    ]
)
