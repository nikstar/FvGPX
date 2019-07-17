import XCTest
import SWXMLHash
@testable import ThGPX


final class ThGPXTests: XCTestCase {
    func testOSMExample1() {
        do {
            let xml = SWXMLHash.config { config in
                
            }.parse(gpxData1)
            let gpx = try GPX.deserialize(xml["gpx"])
            dump(gpx)
        } catch {
            print(error)
            XCTFail()
        }
    }

    func testOSMExample2() {
        do {
            let xml = SWXMLHash.config { config in
                
            }.parse(gpxData2)
            let gpx = try GPX.deserialize(xml["gpx"])
            dump(gpx)
        } catch {
            print(error)
            XCTFail()
        }
    }

    func testOSMExample3() {
        do {
            let xml = SWXMLHash.config { config in
                
            }.parse(gpxData3)
            let gpx = try GPX.deserialize(xml["gpx"])
            dump(gpx)
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testPerformance3() {
        do {
            for _ in 0..<25 {
                let xml = SWXMLHash.parse(gpxData3)
                let gpx = try GPX.deserialize(xml["gpx"])
                print(gpx.tracks[0].segments[0].points.count)
            }
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    static var allTests = [
        ("testOSMExample1", testOSMExample1),
        ("testOSMExample2", testOSMExample2),
        ("testOSMExample3", testOSMExample3),
    ]
}
