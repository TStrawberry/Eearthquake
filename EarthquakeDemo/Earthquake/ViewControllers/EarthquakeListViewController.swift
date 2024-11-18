//
//  ViewController.swift
//  EarthquakeDemo
//
//  Created by tao on 2024/11/15.
//

import UIKit

@MainActor
class EarthquakeListViewController: UIViewController {

    private let tableView: UITableView = { return UITableView() }()

    override func viewDidLoad() {
        super.viewDidLoad()

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
        tableView.refreshControl = refreshControl
    }
}


extension EarthquakeListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EarthquakeListCell.reuseIdentifier, for: indexPath) as! EarthquakeListCell

        cell.textLabel?.text = "text label"
        return cell
    }
}
