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
        iso8601formatter.date(from: string)
    }
}

fileprivate var iso8601formatter = ISO8601DateFormatter()
