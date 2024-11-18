//
//  File.swift
//  EarthquakeDemoTests
//
//  Created by tao on 2024/11/17.
//

import XCTest
@testable import EarthquakeDemo

final class EarthquakeListModelTests: XCTestCase {
    
    var model: EarthquakeListModel!
    var service: MockEarthquakeService!
    
    override func setUp() {
        super.setUp()
        service = MockEarthquakeService()
        model = EarthquakeListModel(earthquakeService: service)
    }
    
    func testFetchEarthquakeList() async throws {
        let earthquake = Earthquake(
            type: "Feature",
            properties: Properties(
                mag: 3.22,
                place: "place",
                type: "type",
                title: "M 7.2 - 274 km SW"
            ),
            geometry: Geometry(
                type: "Point",
                coordinates: [
                    -177.1067,
                     -22.9936,
                     179
                ]
            ),
            id: "us7000k8qh"
        )
        service.result = .success([earthquake])
        
        let _ = try await model.fetch()
        
        XCTAssertEqual(
            self.model.earthquakes,
            [earthquake]
        )
    }
}


