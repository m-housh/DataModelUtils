# DataModelUtils

Utilities for representing data models in `SwiftUI`.


## Usage
------------

Require the package in your *Package.swift* file or through Xcode.

Package.swift
```swift
    let package = Package(
        ...
        platforms: [
            .macOS(.v10_15),
            .iOS(.v13),
        ],
        dependencies: [
            ...
            .package(url: "https://github.com/m-housh/DataModelUtils.git", from: "0.1.0"),
        ],
        targets: [
            .target(name: "MyPackage", dependencies: ["DataModelUtils", ...]),
            ...
        ]
    )
```

**See tests for more details**
