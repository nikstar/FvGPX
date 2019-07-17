import Foundation
import SWXMLHash

extension Date : XMLElementDeserializable, XMLAttributeDeserializable {
    public static func deserialize(_ element: SWXMLHash.XMLElement) throws -> Date {
        let s = String.deserialize(element)
        if let date = date(from: s) {
            return date
        } else {
            throw XMLDeserializationError.typeConversionFailed(type: "ISO 8601 date", element: element)
        }
    }
    
    public static func deserialize(_ attribute: XMLAttribute) throws -> Date {
        let s = String.deserialize(attribute)
        if let date = date(from: s) {
            return date
        } else {
            throw XMLDeserializationError.attributeDeserializationFailed(type: "ISO 8601 date", attribute: attribute)
        }
    }
    
    
    fileprivate static func date(from string: String) -> Date? {
        ISO8601DateFormatter().date(from: string)
    }
}

