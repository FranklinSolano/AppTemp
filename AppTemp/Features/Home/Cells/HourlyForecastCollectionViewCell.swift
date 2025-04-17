//
//  HourlyForecastCollectionViewCell.swift
//  AppTemp
//
//  Created by Franklin  Stilhano Solano on 17/04/25.
//

import UIKit
import SnapKit

class HourlyForecastCollectionViewCell: UICollectionViewCell {
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [hourlLabel, iconHourlyImageView, temperatureLabel])
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
    
    lazy var hourlLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "13:00"
        label.font = .systemFont(ofSize: 10, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    lazy var iconHourlyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.iconSun
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor(red: 1.0, green: 204/255, blue: 102/255, alpha: 1.0)
        return imageView
    }()
    
    lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "25C"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    
    static let indentifier: String = "HourlyForecastCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    
}

extension HourlyForecastCollectionViewCell: ViewCodeProtocol {
    func setupElements() {
        contentView.addSubview(stackView)
    }
    
    func setupConstraints() {
        stackViewContraisSnapKit()
        iconHourlyImageViewSnapKit()
    }
    
    private func stackViewContraisSnapKit(){
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func iconHourlyImageViewSnapKit(){
        iconHourlyImageView.snp.makeConstraints { make in
            make.height.equalTo(33)
        }
    }
    
}
