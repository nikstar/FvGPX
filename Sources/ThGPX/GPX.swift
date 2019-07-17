import SWXMLHash

/// GPX documents contain a metadata header, followed by waypoints, routes, and tracks.  You can add your own elements to the extensions section of the GPX document.
public struct GPX {
    
    /// You must include the version number in your GPX document.
//    public let version = "1.1"
    
    /// You must include the name or URL of the software that created your GPX document.  This allows others to inform the creator of a GPX instance document that fails to validate.
//    public var creator = "ThGPX (https://github.com/nikstar/thgpx)"
    
    /// Metadata about the file.
    public var metadata: Metadata?
    
    /// A list of waypoints.
    public var waypoints: [Waypoint] = []
    
    /// A list of routes.
    public var routes: [Route] = []
    
    /// A list of tracks.
    public var tracks: [Track] = []
    
    /// You can add extend GPX by adding your own elements from another schema here.
//    public var extensions: [Any] = []
}

extension GPX: XMLIndexerDeserializable {
    public static func deserialize(_ node: XMLIndexer) throws -> GPX {
        GPX(
            metadata: try node["metadata"].value(),
            waypoints: try node["wpt"].all.map { try $0.value() },
            routes: try node["rte"].all.map { try $0.value() },
            tracks: try node["trk"].all.map { try $0.value() }
        )
    }
}
