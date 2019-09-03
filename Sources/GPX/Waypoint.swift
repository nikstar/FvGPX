import Foundation
import SWXMLHash

/// wpt represents a waypoint, point of interest, or named feature on a map.
public struct Waypoint {
    
    // MARK: - Coordinates
    
    /// The latitude of the point (-90...+90).  This is always in decimal degrees, and always in WGS84 datum.
    public var latitude: Double
    
    /// The longitude of the point (-180...+180).  This is always in decimal degrees, and always in WGS84 datum.
    public var longitude: Double
    
    // MARK: - Position info
    
    /// Elevation (in meters) of the point.
    public var elevation: Double?
    
    /// Creation/modification timestamp for element. Date and time in are in Univeral Coordinated Time (UTC), not local time! Conforms to ISO 8601 specification for date/time representation. Fractional seconds are allowed for millisecond timing in tracklogs.
    public var time: Date?
    
    /// Magnetic variation (in degrees) at the point
    public var magenticVariation: Double?
    
    /// Height (in meters) of geoid (mean sea level) above WGS84 earth ellipsoid.  As defined in NMEA GGA message.
    public var geoidHeight: Double?
    
    // MARK: - Description info
    
    /// The GPS name of the waypoint. This field will be transferred to and from the GPS. GPX does not place restrictions on the length of this field or the characters contained in it. It is up to the receiving application to validate the field before sending it to the GPS.
    public var name: String?
    
    /// GPS waypoint comment. Sent to GPS as comment.
    public var comment: String?
    
    /// A text description of the element. Holds additional information about the element intended for the user, not the GPS.
    public var description: String?
    
    /// Source of data. Included to give user some idea of reliability and accuracy of data.  "Garmin eTrex", "USGS quad Boston North", e.g.
    public var source: String?

    /// Link to additional information about the waypoint.
//    public var link: Link?
    
    /// Text of GPS symbol name. For interchange with other programs, use the exact spelling of the symbol as displayed on the GPS.  If the GPS abbreviates words, spell them out.
    public var sym: String?
    
    /// Type (classification) of waypoint.
    public var type: String?
    
    // MARK: Accuracy info
    
    /// Type of GPX fix.
//    public var fix: Fix?
    
    /// Number of satellites used to calculate the GPX fix.
    public var sat: Int?
    
    /// Horizontal dilution of precision.
    public var hdop: Double?
    
    /// Vertical dilution of precision.
    public var vdop: Double?
    
    /// Position dilution of precision.
    public var pdop: Double?
    
    /// Number of seconds since last DGPS update.
    public var ageOfDGPSData: Double?
    
    /// ID of DGPS station used in differential correction.
    public var dgpsID: String?
}

extension Waypoint : XMLIndexerDeserializable {
    public static func deserialize(_ node: XMLIndexer) throws -> Waypoint {
        Waypoint(
            latitude: try node.value(ofAttribute: "lat"),
            longitude: try node.value(ofAttribute: "lon"),
            
            elevation: try? node["ele"].value(),
            time: try? node["time"].value(),
            magenticVariation: try? node["magvar"].value(),
            geoidHeight: try? node["geoidheight"].value(),
            
            name: try? node["name"].value(),
            comment: try? node["cmt"].value(),
            description: try? node["desc"].value(),
            source: try? node["src"].value(),
            sym: try? node["sym"].value(),
            type: try? node["type"].value(),
            
            sat: try? node["sat"].value(),
            hdop: try? node["hdop"].value(),
            vdop: try? node["vdop"].value(),
            pdop: try? node["pdop"].value(),
            ageOfDGPSData: try? node["ageofdgpsdata"].value(),
            dgpsID: try? node["dgpsid"].value()
        )
    }
}

extension Waypoint : Codable {}
