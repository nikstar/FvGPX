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
    public var time: Date?
    
    /// Keywords associated with the file.  Search engines or databases can use this information to classify the data.
    public var keywords: String?
    
    /// Minimum and maximum coordinates which describe the extent of the coordinates in the file.
//    public var bounds: Bounds?
}

extension Metadata: XMLIndexerDeserializable {
    public static func deserialize(_ element: XMLIndexer) throws -> Metadata {
        let name = element["name"].element.map(String.deserialize)
        let description = element["desc"].element.map(String.deserialize)
//        let author = try? Author.deserialize(element["name"])
//        let copyright = try? Copyright.deserialize(element["copyright"])
//        let link = try? Link.deserialize(element["link"])
        let time = try? element["time"].element.map(Date.deserialize)
        let keywords = element["keywords"].element.map(String.deserialize)
//        let bounds = try? Bounds.deserialize(element["bounds"])
        
        return Metadata(name: name, description: description, time: time, keywords: keywords)
    }
}
