# GPX.swift

**GPX.swift** parses GPX [according to spec](https://www.topografix.com/gpx.asp). 

Dates are parsed lazily, but otherwise this package does not attempt to do anything smart and stays close to the schema. All structs and properies are documented, feel free to browse [sources](Sources/GPX)

```swift
import GPX

let gpx = try GPX(data: data)
```

Keep in mind that this call takes nontrivial time for large files.

Add to your project via Swift package manager:

```
        .package(url: "https://github.com/nikstar/GPX.swift.git", from: "0.2.1")
```
