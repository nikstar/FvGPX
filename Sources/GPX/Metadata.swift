import Foundation
import SWXMLHash

/// Information about the GPX file, author, and copyright restrictions goes in the metadata section.  Providing rich, meaningful information about your GPX files allows others to search for and use your GPS data.
public struct Metadata {
    
    /// The name of the GPX file.
    public var name: String?
    
    /// A description of the contents of the GPX file.
    public var description: String?
    
    /// The person or organization who created the GPX file.
//    public var author: Author?
    
    /// Copyright and license information governing use of the file.
//    public var copyright: Copyright?
    
    /// URLs associated with the location described in the file.
//    public var links: [Link] = []
    
    /// The creation date of the file.
    public var date: LazyDate?
    
    /// Keywords associated with the file.  Search engines or databases can use this information to classify the data.
    public var keywords: String?
    
    /// Minimum and maximum coordinates which describe the extent of the coordinates in the file.
//    public var bounds: Bounds?
}

extension Metadata : XMLIndexerDeserializable {
    public static func deserialize(_ element: XMLIndexer) throws -> Metadata {
        Metadata(
            name: try? element["name"].value(),
            description: try? element["desc"].value(),
            date: try? element["time"].value(),
            keywords: try? element["keywords"].value()
        )
    }
}

extension Metadata : Codable {}
