import XCTest
import SWXMLHash
@testable import ThGPX

let gpxString1 = """
<?xml version="1.0" encoding="UTF-8"?>
<gpx version="1.0">
<name>Example gpx</name>
<wpt lat="46.57638889" lon="8.89263889">
<ele>2372</ele>
<name>LAGORETICO</name>
</wpt>
<trk><name>Example gpx</name><number>1</number><trkseg>
<trkpt lat="46.57608333" lon="8.89241667"><ele>2376</ele><time>2007-10-14T10:09:57Z</time></trkpt>
<trkpt lat="46.57619444" lon="8.89252778"><ele>2375</ele><time>2007-10-14T10:10:52Z</time></trkpt>
<trkpt lat="46.57641667" lon="8.89266667"><ele>2372</ele><time>2007-10-14T10:12:39Z</time></trkpt>
<trkpt lat="46.57650000" lon="8.89280556"><ele>2373</ele><time>2007-10-14T10:13:12Z</time></trkpt>
<trkpt lat="46.57638889" lon="8.89302778"><ele>2374</ele><time>2007-10-14T10:13:20Z</time></trkpt>
<trkpt lat="46.57652778" lon="8.89322222"><ele>2375</ele><time>2007-10-14T10:13:48Z</time></trkpt>
<trkpt lat="46.57661111" lon="8.89344444"><ele>2376</ele><time>2007-10-14T10:14:08Z</time></trkpt>
</trkseg></trk>
</gpx>
"""
let gpxData1 = gpxString1.data(using: .utf8)!

let gpxString2 = """
<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<gpx version="1.1"
creator="EMTAC BTGPS Trine II DataLog Dump 1.0 - http://www.ayeltd.biz"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns="http://www.topografix.com/GPX/1/1"
xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd">
<metadata>
<name>GPS Receiver track log</name>
<desc>Tallinn (car)</desc>
<author>
<name>Michael Collinson</name>
<email id="mikes" domain="ayeltd.biz" />
<link href="http://www.ayeltd.biz"><text>AYE Ltd.</text></link>
</author>
<time>2007-10-02T09:22:06Z</time>
<keywords>Estonia, Tallinn, A. Weizbergi</keywords>
<bounds minlat="59.4367664166667" maxlat="59.4440920666666" minlon="24.74394385" maxlon="24.7971432"/>
</metadata>
<trk>
<src>Logged by Michael Collinson using EMTAC BTGPS Trine II</src>
<link href="http://www.ayeltd.biz"><text>AYE Ltd.</text></link>
<trkseg>
<trkpt lat="59.4408327" lon="24.74516185">
<ele>44</ele>
<time>2007-10-02T07:54:30Z</time>
<fix>3d</fix>
<hdop>300</hdop><vdop>300</vdop><pdop>300</pdop>
</trkpt>
</trkseg>
</trk>
</gpx>
"""
let gpxData2 = gpxString2.data(using: .utf8)!

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

    
    static var allTests = [
        ("testOSMExample1", testOSMExample1),
        ("testOSMExample2", testOSMExample2),
    ]
}
