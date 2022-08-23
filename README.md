
[![Swift](https://img.shields.io/badge/Swift-5.6-orange.svg)](https://swift.org)
[![SPM compatible](https://img.shields.io/badge/SPM-Compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager/)
[![Cocoapods](https://img.shields.io/cocoapods/v/EverythingAtOnce.svg)](https://cocoapods.org/pods/EverythingAtOnce)
[![MIT](https://img.shields.io/badge/License-MIT-red.svg)](https://opensource.org/licenses/MIT)

This repo contains a set of swift extensions for the Apple frameworks that could be used in any project.

## Requirements
- Swift 5.6+
- **iOS** 13.0+

## Installation

### [CocoaPods](https://guides.cocoapods.org/using/using-cocoapods.html)

```ruby
# Podfile
use_frameworks!
target 'YOUR_TARGET_NAME' do
    pod 'EverythingAtOnce'
end
```

Replace `YOUR_TARGET_NAME` and then, in the `Podfile` directory, type:

```bash
$ pod install
```

### [Swift Package Manager](https://swift.org/package-manager)

```swift
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    targets: [],
    dependencies: [
        .package(url: "https://github.com/whutao/everything-at-once.git", from: "0.1.5")
    ]
)
```

Next, add it to your targets dependencies:

```swift
.target(
    name: "YOUR_TARGET_NAME",
    dependencies: [
        "EverythingAtOnce",
    ]
)
```

Then run `swift package update`.

## License
The package is released under the MIT license. See [LICENSE](https://github.com/SwifterSwift/SwifterSwift/blob/master/LICENSE) for more information.
