// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "SixDots",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "SixDots",
            targets: ["AppModule"],
            bundleIdentifier: "pos.academy.SixDots",
            teamIdentifier: "7D5PZJWQ9T",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .twoPeople),
            accentColor: .asset("AccentColor"),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ],
            appCategory: .utilities
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)