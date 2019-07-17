import SWXMLHash

/// rte represents route - an ordered list of waypoints representing a series of turn points leading to a destination.
public struct Route {
    
    /// GPS name of route.
    public var name: String?
    
    /// GPS comment for route.
    public var comment: String?
    
    /// Text description of route for user.  Not sent to GPS.
    public var description: String?
    
    /// Source of data. Included to give user some idea of reliability and accuracy of data.
    public var source: String?
    
    /// Links to external information about the route.
    public var link: String?
    
    /// GPS route number.
    public var number: Int?
    
    /// Type (classification) of route.
    public var type: String?
    
    /// You can add extend GPX by adding your own elements from another schema here.
    public var extensions: [Any] = []
    
    /// A list of route points.
    public var points: [Waypoint]
}

extension Route : XMLIndexerDeserializable {
    public static func deserialize(_ element: XMLIndexer) throws -> Route {
        let points = try element["rtept"].all.map(Waypoint.deserialize)
        return Route(points: points)
    }
}
