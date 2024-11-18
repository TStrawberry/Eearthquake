//
//  EarthquakeCellViewModelTests.swift
//  EarthquakeDemo
//
//  Created by tao on 2024/11/17.
//


import XCTest
@testable import EarthquakeDemo

final class EarthquakeCellViewModelTests: XCTestCase {
    
    var viewModel: EarthquakeCellViewModel!
    let place: String = "Any place"
    
    func testPlaceText() async {
        self.viewModel = await EarthquakeCellViewModel(place: place, magnitude: 7.49999)
        let viewModelPlaceText = await self.viewModel.placeText
        XCTAssertEqual(
            viewModelPlaceText,
            "Place - Any place"
        )
    }
    
    func testMagnitudeTest() async {
        self.viewModel = await EarthquakeCellViewModel(place: place, magnitude: 7.49999)
        let viewModelMagnitudeText = await self.viewModel.magnitudeText
        XCTAssertEqual(
            viewModelMagnitudeText,
            "Magnitude 7.49999"
        )
    }
    
    func testBackgroundWhenMagnitudeIsLessThan7_5() async {
        self.viewModel = await EarthquakeCellViewModel(place: place, magnitude: 7.49999)
        let backgroundColor = await viewModel.backgroundColor
        XCTAssertEqual(
            backgroundColor.cgColor.components,
            UIColor.lightGray.withProminence(.tertiary).cgColor.components
        )
    }
    
    func testBackgroundWhenMagnitudeIsEqualTo7_5() async {
        self.viewModel = await EarthquakeCellViewModel(place: place, magnitude: 7.5)
        let backgroundColor = await viewModel.backgroundColor
        XCTAssertEqual(
            backgroundColor.cgColor.components,
            UIColor.white.cgColor.components
        )
    }
    
    func testBackgroundWhenMagnitudeIsGreaterThan7_5() async {
        self.viewModel = await EarthquakeCellViewModel(place: place, magnitude: 7.501)
        let backgroundColor = await viewModel.backgroundColor
        XCTAssertEqual(
            backgroundColor.cgColor.components,
            UIColor.white.cgColor.components
        )
    }
}
