//
//  DailyForecastTableViewCell.swift
//  AppTemp
//
//  Created by Franklin  Stilhano Solano on 17/04/25.
//

import UIKit

class DailyForecastTableViewCell: UITableViewCell {
    
    static let indentifier = "DailyForecastTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
