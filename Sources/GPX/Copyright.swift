import Foundation
import SWXMLHash

/// Information about the copyright holder and any license governing use of this file. By linking to an appropriate license, you may place your data into the public domain or grant additional usage rights.
public struct Copyright {
    
    /// Year of copyright.
    public var year: Int?
    
    /// Link to external file containing license text.
    public var license: String?
    
    /// Copyright holder
    public var author: String
}

extension Copyright: XMLIndexerDeserializable {
    public static func deserialize(_ element: XMLIndexer) throws -> Copyright {
        Copyright(
            year: try? element["year"].value(),
            license: try? element["license"].value(),
            author: try element["author"].value()
        )
    }
}

extension Copyright: Codable {}
