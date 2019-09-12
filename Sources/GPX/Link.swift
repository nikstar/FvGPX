import Foundation
import SWXMLHash

/// A link to an external resource (Web page, digital photo, video clip, etc) with additional information.
public struct Link {
    
    /// URL of hyperlink.
    public var url: String

    /// Text of hyperlink.
    public var text: String?
    
    /// Mime type of content
    public var type: String?
}

extension Link: XMLIndexerDeserializable {
    public static func deserialize(_ element: XMLIndexer) throws -> Link {
        Link(
            url: try element.value(ofAttribute: "href"),
            text: try? element["text"].value(),
            type: try? element["type"].value()
        )
    }
}

extension Link: Equatable, Hashable, Codable { }
