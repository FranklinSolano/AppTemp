//
//  DailyForecastTableViewCell.swift
//  AppTemp
//
//  Created by Franklin  Stilhano Solano on 17/04/25.
//

import UIKit
import SnapKit

class DailyForecastTableViewCell: UITableViewCell {
    static let identifier = "DailyForecastTableViewCell"
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [weekDayLabel, iconImageView, minTemperatureLabel, maxTemperatureLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        stackView.spacing = 15
        return stackView
    }()
    
    lazy var weekDayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    lazy var minTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    lazy var maxTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
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
    
    func configure(with day: ForecastResponse.ForecastDay) {
        let date = Date(timeIntervalSince1970: TimeInterval(day.dateEpoch))
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        formatter.locale = Locale(identifier: "pt_BR")
        weekDayLabel.text = formatter.string(from: date).uppercased()
        
        minTemperatureLabel.text = "Mín. \(Int(day.day.minTempC))°C"
        maxTemperatureLabel.text = "Máx. \(Int(day.day.maxTempC))°C"
        
        // Carregar ícone da URL
        if let url = URL(string: "https:\(day.day.condition.icon)") {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.iconImageView.image = image
                    }
                }
            }
        }
    }
}

extension DailyForecastTableViewCell: ViewCodeProtocol {
    func setupElements() {
        contentView.addSubview(stackView)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        weekDayLabel.snp.makeConstraints { make in
            make.width.lessThanOrEqualTo(50)
        }
    }
}
