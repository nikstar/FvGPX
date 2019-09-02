import Foundation
import SWXMLHash

fileprivate let defaultVersion = "1.1"
fileprivate let defaultCreator = "GPX.swift (https://github.com/nikstar/GPX.swift)"

/// GPX documents contain a metadata header, followed by waypoints, routes, and tracks.  You can add your own elements to the extensions section of the GPX document.
public struct GPX {
    
    /// You must include the version number in your GPX document.
    public var version = defaultVersion
    
    /// You must include the name or URL of the software that created your GPX document.  This allows others to inform the creator of a GPX instance document that fails to validate.
    public var creator = defaultCreator
    
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

extension GPX : XMLIndexerDeserializable {
    public static func deserialize(_ node: XMLIndexer) throws -> GPX {
        GPX(
            version: node.value(ofAttribute: "version") ?? defaultVersion,
            creator: node.value(ofAttribute: "creator") ?? defaultCreator,
            metadata: try node["metadata"].value(),
            waypoints: try node["wpt"].all.map(Waypoint.deserialize),
            routes: try node["rte"].all.map(Route.deserialize),
            tracks: try node["trk"].all.map(Track.deserialize)
        )
    }
}

extension GPX {
    public init(data: Data) throws {
        let xml = SWXMLHash.parse(data)
        self = try GPX.deserialize(xml["gpx"])
    }
}

extension GPX : Codable {}
