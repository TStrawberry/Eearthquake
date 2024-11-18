//
//  File.swift
//  EarthquakeDemoTests
//
//  Created by tao on 2024/11/17.
//

import Foundation
@testable import EarthquakeDemo

final class MockEarthquakeService: EarthquakeService {
    var result: Result<[EarthquakeDemo.Earthquake], Error>!
    
    func fetchEarthquakeList() async throws -> [EarthquakeDemo.Earthquake] {
        return try result.get()
    }
}
