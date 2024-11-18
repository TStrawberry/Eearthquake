//
//  EarthquakeListCell.swift
//  EarthquakeDemo
//
//  Created by tao on 2024/11/16.
//

import UIKit

class EarthquakeListCell: UITableViewCell {
    static let reuseIdentifier = "EarthquakeListCell"
    
    var viewModel: EarthquakeCellViewModel? {
        didSet {
            self.textLabel?.text = viewModel?.placeText
            self.detailTextLabel?.text = viewModel?.magnitudeText
            self.backgroundColor = viewModel?.backgroundColor
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
