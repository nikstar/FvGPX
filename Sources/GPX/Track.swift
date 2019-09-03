import SWXMLHash

/// trk represents a track - an ordered list of points describing a path.
public struct Track {
    
    /// GPS name of track.
    public var name: String?
    
    /// GPS comment for track.
    public var comment: String?
    
    /// User description of track.
    public var description: String?
    
    /// Source of data. Included to give user some idea of reliability and accuracy of data.
    public var source: String?
    
    /// Links to external information about the track.
//    public var link: Link?
    
    /// GPS track number.
    public var number: Int?
    
    /// Type (classification) of track.
    public var type: String?
    
    /// A Track Segment holds a list of Track Points which are logically connected in order. To represent a single GPS track where GPS reception was lost, or the GPS receiver was turned off, start a new Track Segment for each continuous span of track data.
    public var segments: [Segment]
}

extension Track : XMLIndexerDeserializable {
    public static func deserialize(_ element: XMLIndexer) throws -> Track {
        Track(
            name: try? element["name"].value(),
            comment: try? element["cmt"].value(),
            description: try? element["desc"].value(),
            source: try? element["src"].value(),
            number: try? element["number"].value(),
            type: try? element["type"].value(),
            segments: try element["trkseg"].all.map(Segment.deserialize)
        )
    }
}

extension Track : Codable {}
