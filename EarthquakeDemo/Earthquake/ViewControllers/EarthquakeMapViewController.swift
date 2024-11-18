//
//  EarthquakeMapViewController.swift
//  EarthquakeDemo
//
//  Created by tao on 2024/11/16.
//

import UIKit
import MapKit

@MainActor
class EarthquakeMapViewController: UIViewController {
    let coordinate: CLLocationCoordinate2D
    
    private lazy var mapView: MKMapView = { MKMapView() }()
    private lazy var closeButton: UIButton = { UIButton(type: .system) }()
    
    init(latitude: Double, longitude: Double) {
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the map view
        setupMapView()
        setupCloseButton()
        addPin()
    }
}

extension EarthquakeMapViewController {
    private func setupMapView() {
        view.addSubview(mapView)

        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupCloseButton() {
        view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        closeButton.tintColor = .white
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }

    private func addPin() {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        
        // Center the map on the pin
        let region = MKCoordinateRegion(
            center: coordinate,
            latitudinalMeters: 1000_0000,
            longitudinalMeters: 1000_0000
        )
        mapView.setRegion(region, animated: true)
    }

    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }

}
