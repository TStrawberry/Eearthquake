//
//  Untitled.swift
//  EarthquakeDemo
//
//  Created by tao on 2024/11/15.
//


import Combine

final class EarthquakeListModel {
    let earthquakeService: any EarthquakeService

    @Published private(set) var earthquakes: [Earthquake] = []

    @Published private(set) var error: Error?
 
    init(earthquakeService: any EarthquakeService = APIServiceImp.default) {
        self.earthquakeService = earthquakeService
    }
    
    func fetch() {
        Task {
            _ = try? await fetch()
        }
    }
    
    func fetch() async throws -> [Earthquake] {
        do {
            let items = try await earthquakeService.fetchEarthquakeList()
            self.earthquakes = items
            self.error = nil
            return items
        } catch {
            self.error = error
            self.earthquakes = []
            throw error
        }
    }
}
