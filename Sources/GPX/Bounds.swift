import Foundation
import SWXMLHash

/// Two lat/lon pairs defining the extent of an element.
public struct Bounds {
    
    /// The minimum latitude.
    public var minLatitude: Double
    
    /// The minimum longitude.
    public var minLongitude: Double
    
    /// The maximum latitude.
    public var maxLatitude: Double
    
    /// The maximum longitude.
    public var maxLongitude: Double
}

extension Bounds: XMLIndexerDeserializable {
    public static func deserialize(_ element: XMLIndexer) throws -> Bounds {
        Bounds(
            minLatitude: try element.value(ofAttribute: "minlat"),
            minLongitude: try element.value(ofAttribute: "minlon"),
            maxLatitude: try element.value(ofAttribute: "maxlat"),
            maxLongitude: try element.value(ofAttribute: "maxlon")
        )
    }
}

extension Bounds: Codable {}
