//
//  EarthquakeListCell.swift
//  EarthquakeDemo
//
//  Created by tao on 2024/11/16.
//

import UIKit

class EarthquakeListCell: UITableViewCell {
    static let reuseIdentifier = "EarthquakeListCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
