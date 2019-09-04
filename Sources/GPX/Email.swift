import Foundation
import SWXMLHash

/// An email address.  Broken into two parts (id and domain) to help prevent email harvesting. This type is internal.
struct Email {
    
    var value: String
}

extension Email: XMLIndexerDeserializable {
    static func deserialize(_ element: XMLIndexer) throws -> Email {
        let id: String = try element.value(ofAttribute: "id")
        let domain: String = try element.value(ofAttribute: "domain")
        
        return Email(value: "\(id)@\(domain)")
    }
}

extension Email: Codable {}
