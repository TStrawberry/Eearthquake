//
//  EarthquakeService.swift
//  EarthquakeDemo
//
//  Created by tao on 2024/11/15.
//

protocol EarthquakeService {
    func fetchEarthquakeList() async throws -> [Earthquake]
}

extension APIServiceImp: EarthquakeService {
    func fetchEarthquakeList() async throws -> [Earthquake] {
        let urlString = "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2023-01-01&endtime=2024-01-01&minmagnitude=7"
        return try await get(urlString: urlString)
    }
}
