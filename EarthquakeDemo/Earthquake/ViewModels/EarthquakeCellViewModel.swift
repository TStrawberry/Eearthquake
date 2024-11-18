//
//  EarthquakeCellViewModel.swift
//  EarthquakeDemo
//
//  Created by tao on 2024/11/16.
//

import UIKit

@MainActor
class EarthquakeCellViewModel {
    let magnitude: Double
    let place: String
    
    var placeText: String { "Place - " + place }
    var magnitudeText: String { "Magnitude \(magnitude)" }
    
    var backgroundColor: UIColor {
        if 7.5 <= magnitude {
            return UIColor.white
        } else {
            return UIColor.lightGray.withProminence(.tertiary)
        }
    }
 
    init(place: String, magnitude: Double) {
        self.place = place
        self.magnitude = magnitude
    }
}
