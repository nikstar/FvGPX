import Foundation
import SWXMLHash

public final class LazyDate {
    
    public var value: Date? {
        if !parsed {
            date = iso8601formatter.date(from: string)
            parsed = true
        }
        return date
    }
    
    public let string: String
    fileprivate var parsed = false
    fileprivate var date: Date?
    
    public init(string: String) {
        self.string = string
    }
}

fileprivate var iso8601formatter = ISO8601DateFormatter()

extension LazyDate: XMLElementDeserializable, XMLAttributeDeserializable {
    public static func deserialize(_ element: SWXMLHash.XMLElement) throws -> LazyDate {
        LazyDate(string: .deserialize(element))
    }

    public static func deserialize(_ attribute: XMLAttribute) throws -> LazyDate {
        LazyDate(string: .deserialize(attribute))
    }
}

extension LazyDate: Equatable, Hashable, Codable {
    public static func == (lhs: LazyDate, rhs: LazyDate) -> Bool {
        lhs.string == rhs.string
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(string)
    }
}
