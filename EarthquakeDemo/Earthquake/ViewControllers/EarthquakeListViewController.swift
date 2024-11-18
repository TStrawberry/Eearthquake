//
//  ViewController.swift
//  EarthquakeDemo
//
//  Created by tao on 2024/11/15.
//

import UIKit
import Combine

@MainActor
class EarthquakeListViewController: UIViewController {
    let viewModel = EarthquakeListViewModel()

    private let tableView: UITableView = { return UITableView() }()
    
    private var cancellable: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
        setupTableView()
        setupRefreshControl()
    }
}

extension EarthquakeListViewController {
    private func setupTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(EarthquakeListCell.self, forCellReuseIdentifier: EarthquakeListCell.reuseIdentifier)
    }
    
    private func setupRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(viewModel, action: #selector(viewModel.onRefreshControlTriggered), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    private func bindViewModel() {
        viewModel.$earthquakeList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellable)
        
        viewModel.$isLoading
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isLoading in
                if isLoading {
                    self?.tableView.refreshControl?.beginRefreshing()
                } else {
                    self?.tableView.refreshControl?.endRefreshing()
                }
            }
            .store(in: &cancellable)
    }
}


extension EarthquakeListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.earthquakeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EarthquakeListCell.reuseIdentifier, for: indexPath) as! EarthquakeListCell

        let earthquake = viewModel.earthquakeList[indexPath.row]
        cell.viewModel = EarthquakeCellViewModel(
            place: earthquake.properties.place,
            magnitude: earthquake.properties.mag
        )
        return cell
    }
}
