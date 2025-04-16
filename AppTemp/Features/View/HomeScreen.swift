//
//  HomeScreen.swift
//  AppTemp
//
//  Created by Franklin  Stilhano Solano on 16/04/25.
//

import UIKit

class HomeScreen: UIView {
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    lazy var cityNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello World"
        return label
    }()
    
    lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello World"
        return label
    }()
    
    lazy var iconTemperatureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "sun.max")
        return imageView
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        backgroundColor = .blue
        setupElements()
        setupConstraints()
    }
    
    private func setupElements(){
        addSubview(headerView)
        addSubview(cityNameLabel)
        addSubview(temperatureLabel)
        addSubview(iconTemperatureImageView)
    }
    
    private func setupConstraints() {
        
    }
    
    
    
}
