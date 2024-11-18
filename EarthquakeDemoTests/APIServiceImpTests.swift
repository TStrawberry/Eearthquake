//
//  EarthquakeDemoTests.swift
//  EarthquakeDemoTests
//
//  Created by tao on 2024/11/15.
//

import XCTest
@testable import EarthquakeDemo

final class APIServiceImpTests: XCTestCase {
    var service: MockAPIService!
    let urlString = "https://earthquake.usgs.gov"
    
    override func setUp() {
        super.setUp()
        self.service = MockAPIService()
    }

    func testSettingURLAndHeaders() async throws {
        service.result = .success(true)
        let _: Bool = try await service.get(urlString: urlString, headers: ["headerKey":"headerValue"])
        
        XCTAssertEqual(service.request.url?.absoluteString, urlString)
        XCTAssertEqual(service.request.allHTTPHeaderFields!["headerKey"], "headerValue")
    }
    

}
