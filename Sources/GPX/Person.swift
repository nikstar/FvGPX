import Foundation
import SWXMLHash

/// A person or organization.
public struct Person {
    /// Name of person or organization.
    public var name: String?
    
    /// Email address.
//    public var email: Email?
    
    /// Link to Web site or other external information about person.
    public var link: Link?
}

extension Person: XMLIndexerDeserializable {
    public static func deserialize(_ element: XMLIndexer) throws -> Person {
        Person(
            name: try? element["name"].value(),
            link: try? element["link"].value()
        )
    }
}

extension Person: Codable {}

