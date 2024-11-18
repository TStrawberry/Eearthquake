//
//  EarthquakeList.swift
//  EarthquakeDemo
//
//  Created by tao on 2024/11/15.
//

import Foundation
import Combine

@MainActor
final class EarthquakeListViewModel {
    
    let model: EarthquakeListModel

    @Published private(set) var isLoading: Bool = false
    @Published var earthquakeList: [Earthquake] = []
    @Published var errorString: String? = nil
    
    // Added init method with EarthquakeService injection
    init(model: EarthquakeListModel = EarthquakeListModel()) {
        self.model = model
        
        bindModel()
        fetch()
    }
    
    func bindModel() {
        model.$earthquakes
            .assign(to: &$earthquakeList)

        model.$error
            .compactMap(\.self)
            .map(\.localizedDescription)
            .assign(to: &$errorString)
    }

    func fetch() {
        Task {
            self.isLoading = true
            _ = try? await model.fetch()
            self.isLoading = false
        }
    }
    
    @objc func onRefreshControlTriggered() {
        fetch()
    }
}
