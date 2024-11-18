//
//  MockAPIService.swift
//  EarthquakeDemo
//
//  Created by tao on 2024/11/17.
//

import Foundation
@testable import EarthquakeDemo

final class MockAPIService: APIService {
    var result: Result<Any, Error>!
    var request: URLRequest!
    
    func send<T>(request: URLRequest) async throws -> T where T : Decodable, T : Encodable {
        self.request = request
        return try result.get() as! T
    }
}
