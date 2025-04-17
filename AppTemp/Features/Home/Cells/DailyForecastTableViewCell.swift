//
//  DailyForecastTableViewCell.swift
//  AppTemp
//
//  Created by Franklin  Stilhano Solano on 17/04/25.
//

import UIKit
import SnapKit

class DailyForecastTableViewCell: UITableViewCell {
    
    static let indentifier = "DailyForecastTableViewCell"
    
    
    lazy var weekDayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.text = "TER"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    lazy var minTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.text = "min 25C"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    lazy var maxTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.text = "TER"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = AppImage.iconTableViewCell
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [weekDayLabel, iconImageView, minTemperatureLabel, maxTemperatureLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        stackView.spacing = 15
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DailyForecastTableViewCell: ViewCodeProtocol {
    func setupElements() {
        contentView.addSubview(stackView)
    }
    
    func setupConstraints() {
        stackViewSnapKit()
        weekDayLabelSnapkit()
    }
    
    private func stackViewSnapKit(){
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func weekDayLabelSnapkit(){
        weekDayLabel.snp.makeConstraints { make in
            make.width.lessThanOrEqualTo(50)
        }
    }
    
}
