//
//  HourlyForecastCollectionViewCell.swift
//  AppTemp
//
//  Created by Franklin  Stilhano Solano on 17/04/25.
//

import UIKit
import SnapKit

class HourlyForecastCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "HourlyForecastCollectionViewCell"
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [hourLabel, iconHourlyImageView, temperatureLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 20
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.primaryColor.cgColor
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        return stackView
    }()
    
    lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var iconHourlyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor(red: 1.0, green: 204/255, blue: 102/255, alpha: 1.0)
        return imageView
    }()
    
    lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with hour: ForecastResponse.Hour) {
        let date = Date(timeIntervalSince1970: TimeInterval(hour.timeEpoch))
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        hourLabel.text = formatter.string(from: date)
        
        temperatureLabel.text = "\(Int(hour.tempC))°C"
        
        // Carregar ícone da URL
        if let url = URL(string: "https:\(hour.condition.icon)") {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.iconHourlyImageView.image = image
                    }
                }
            }
        }
    }
}

extension HourlyForecastCollectionViewCell: ViewCodeProtocol {
    func setupElements() {
        contentView.addSubview(stackView)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        iconHourlyImageView.snp.makeConstraints { make in
            make.height.equalTo(33)
        }
    }
}
