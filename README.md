# ThGPX

This library parses GPX files [according to spec](https://www.topografix.com/gpx.asp). It parses dates, but otherwise does not attempt to do anything smart and stays close to the schema. All structs and properies are documented, feel free to browse [sources](./Sources)

```swift
import ThGPX

let gpx = try GPX(data: data)
```

Keep in mind that this call takes nontrivial time for large files.

Add to your project via Swift package manager:

```
        .package(url: "https://github.com/nikstar/ThGPX.git", .branch("master"))
```
