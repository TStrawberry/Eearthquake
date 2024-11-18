//
//  Untitled.swift
//  EarthquakeDemo
//
//  Created by tao on 2024/11/15.
//

// MARK: - Earthquake
struct Earthquake: Codable, Hashable {
    let type: String
    let properties: Properties
    let geometry: Geometry
    let id: String
}

// MARK: - Properties
struct Properties: Codable, Hashable {
    let mag: Double
    let place: String
    let type: String
    let title: String
}

// MARK: - Geometry
struct Geometry: Codable, Hashable {
    let type: String
    let coordinates: [Double]
}

