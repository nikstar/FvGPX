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
    
    /// You can add extend GPX by adding your own elements from another schema here.
//    public var extensions: [Any] = []
    
    /// A Track Segment holds a list of Track Points which are logically connected in order. To represent a single GPS track where GPS reception was lost, or the GPS receiver was turned off, start a new Track Segment for each continuous span of track data.
    public var segments: [Segment]
}

extension Track : XMLIndexerDeserializable {
    public static func deserialize(_ element: XMLIndexer) throws -> Track {
        
        let name = element["name"].element.map(String.deserialize)
        let comment = element["cmt"].element.map(String.deserialize)
        let description = element["desc"].element.map(String.deserialize)
        let source = element["src"].element.map(String.deserialize)
//        let link = try? Link.deserialize(element["link"])
        let number = try? element["number"].element.map(Int.deserialize)
        let type = element["type"].element.map(String.deserialize)
        let segments = try element["trkseg"].all.map(Segment.deserialize)

        return Track(name: name, comment: comment, description: description, source: source, number: number, type: type, segments: segments)
    }
}
