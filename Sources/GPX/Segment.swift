import SWXMLHash

/// A Track Segment holds a list of Track Points which are logically connected in order. To represent a single GPS track where GPS reception was lost, or the GPS receiver was turned off, start a new Track Segment for each continuous span of track data.
public struct Segment {
    
    /// A Track Point holds the coordinates, elevation, timestamp, and metadata for a single point in a track.
    public var points: [Waypoint]
}

extension Segment : XMLIndexerDeserializable {
    public static func deserialize(_ element: XMLIndexer) throws -> Segment {
        Segment(
            points: try element["trkpt"].all.map(Waypoint.deserialize)
        )
    }
}

extension Segment : Codable {}
