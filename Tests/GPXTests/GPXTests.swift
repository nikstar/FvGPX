import XCTest
import SWXMLHash
@testable import GPX


final class GPXTests: XCTestCase {
    func testOSMExample1() {
        do {
            let xml = SWXMLHash.config { config in
                
            }.parse(gpxData1)
            let gpx = try GPX.deserialize(xml["gpx"])
            dump(gpx, maxDepth: 5)
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
            dump(gpx, maxDepth: 5)
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
            dump(gpx, maxDepth: 5)
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testPerformance3Full() {
        measure {
            let gpx = try! GPX(data: gpxData3)
            print(gpx.tracks[0].segments[0].points.count)
        }
    }

    func testPerformance3XML() {
        var xml: XMLIndexer! = nil
        measure {
            xml = SWXMLHash.parse(gpxData3)
        }
        let gpx = try! GPX.deserialize(xml["gpx"])
        print(gpx.tracks[0].segments[0].points.count)
    }

    func testPerformance3GPX() {
        let xml = SWXMLHash.parse(gpxData3)
        let root = xml["gpx"]
        measure {
            let _ = try! GPX.deserialize(root)
        }
    }

    
    static var allTests = [
        ("testOSMExample1", testOSMExample1),
        ("testOSMExample2", testOSMExample2),
        ("testOSMExample3", testOSMExample3),
    ]
}
