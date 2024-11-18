//
//  File.swift
//  EarthquakeDemo
//
//  Created by tao on 2024/11/15.
//

import Foundation

protocol APIService {
    func send<T: Codable>(request: URLRequest) async throws -> T
}

extension APIService {
    func get<T: Codable>(url: URL, headers: [String: String] = [:]) async throws -> T {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        headers.forEach { request.addValue($1, forHTTPHeaderField: $0) }
        return try await send(request: request)
    }
    
    func get<T: Codable>(urlString: String, headers: [String: String] = [:]) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        return try await get(url: url, headers: headers)
    }
}


final class APIServiceImp: APIService {
    nonisolated(unsafe) static let `default`: APIServiceImp = APIServiceImp(session: .shared)
    
    // Add a custom URLSession property
    let session: URLSession
    let decoder = JSONDecoder()
    
    init(session: URLSession) {
        self.session = session
    }
    
    func send<T: Codable>(request: URLRequest) async throws -> T {
        let (data, httpResponse) = try await session.data(for: request)
        
        guard let httpResponse = httpResponse as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        let response = try decoder.decode(Response<T>.self, from: data)
        
        guard response.metadata.status == APIServiceImp.successCode else {
            throw Error.invalidResponse(status: response.metadata.status)
        }

        return response.features
    }
}

extension APIServiceImp {
    static let successCode: Int = 200
}

extension APIServiceImp {
    enum Error: Swift.Error {
        case invalidResponse(status: Int)
        case emptyFeature
    }
    
    // MARK: - EarthquakeResponse
    struct Response<T: Codable>: Codable {
        let type: String
        let metadata: Metadata
        let features: T
    }
    
    // MARK: - Metadata
    struct Metadata: Codable {
        let generated: Int
        let url: String
        let title: String
        let status: Int
        let api: String
        let count: Int
    }
}

