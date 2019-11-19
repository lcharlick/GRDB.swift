// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GRDB",
    products: [
        .library(name: "GRDB", targets: ["GRDB"]),
    ],
    dependencies: [
    ],
    targets: [
        .systemLibrary(
            name: "sqlite3",
            providers: [.apt(["libsqlite3-dev"])]),
        .target(
            name: "GRDB",
            dependencies: ["sqlite3"],
            path: "GRDB"),
        .testTarget(
            name: "GRDBTests",
            dependencies: ["GRDB"],
            path: "Tests",
            exclude: [
                "CocoaPods",
                "CustomSQLite",
                "Crash",
                "Performance",
                "SPM",
            ])
    ],
    swiftSettings: [
        .define("SQLITE_ENABLE_FTS5")
    ],
    swiftLanguageVersions: [.v4_2, .version("5")]
)
