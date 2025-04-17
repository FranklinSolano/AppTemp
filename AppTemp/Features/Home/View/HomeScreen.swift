//
//  HomeScreen.swift
//  AppTemp
//
//  Created by Franklin  Stilhano Solano on 16/04/25.
//
import UIKit
import SnapKit

class HomeScreen: UIView {
    
    lazy var backgroudImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = AppImage.background
        return imageView
    }()
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.primaryColor.cgColor
        return view
    }()
    
    lazy var cityNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "São Paulo"
        label.textColor = .primaryColor
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .primaryColor
        label.text = "25C"
        label.font = .systemFont(ofSize: 70, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    lazy var iconTemperatureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.iconSun
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = UIColor(red: 1.0, green: 204/255, blue: 102/255, alpha: 1.0)
        return imageView
    }()
    
    lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Umidade%"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .darkGray
        return label
    }()
    
    lazy var humidityValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1000mm"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .darkGray
        return label
    }()
    
    lazy var humityStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.addArrangedSubview(humidityLabel)
        stackView.addArrangedSubview(humidityValueLabel)
        return stackView
    }()
    
    lazy var windLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Vento"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .darkGray
        return label
    }()
    
    lazy var windValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10km/h"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .darkGray
        return label
    }()
    
    lazy var windStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.addArrangedSubview(windLabel)
        stackView.addArrangedSubview(windValueLabel)
        return stackView
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.addArrangedSubview(humityStackView)
        stackView.addArrangedSubview(windStackView)
        stackView.spacing = 3
        stackView.backgroundColor = .stackViewColor
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)
        return stackView
    }()
    
    lazy var hourlyForecastLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "PREVISAO POR HORA"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    lazy var hourlyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 67, height: 84)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.register(HourlyForecastCollectionViewCell.self, forCellWithReuseIdentifier:  HourlyForecastCollectionViewCell.indentifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    lazy var dailyForecastLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "PROXIMOS DIAS"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    lazy var dailyForecastTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.register(DailyForecastTableViewCell.self, forCellReuseIdentifier: DailyForecastTableViewCell.indentifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupCollectionViewDelegateAndDataSource(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource){
        hourlyCollectionView.delegate = delegate
        hourlyCollectionView.dataSource = dataSource
    }
    
    public func setupTableViewDelegateAndDataSource(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        dailyForecastTableView.delegate = delegate
        dailyForecastTableView.dataSource = dataSource
    }
    
    private func setupView(){
        setupElements()
        setupConstraintsSnapKit()
    }
    
    private func setupElements(){
        addSubview(backgroudImageView)
        addSubview(headerView)
        headerView.addSubview(cityNameLabel)
        headerView.addSubview(temperatureLabel)
        headerView.addSubview(iconTemperatureImageView)
        addSubview(mainStackView)
        addSubview(hourlyForecastLabel)
        addSubview(hourlyCollectionView)
        addSubview(dailyForecastLabel)
        addSubview(dailyForecastTableView)
        
    }
    
    private func setupConstraintsSnapKit() {
        backgroundImageViewSnapKit()
        headerViewSnapKit()
        cityNameLabelSnapKit()
        temperatureLabelSnapKit()
        iconTemperatureImageViewSnapKit()
        mainStackViewSnapKit()
        hourlyForecastLabelSnapKit()
        hourlyCollectionViewSnapKit()
        dailyForecastLabelSnapKit()
        dailyForecastTableViewSnapKit()
    }
    
    private func backgroundImageViewSnapKit(){
        backgroudImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    private func headerViewSnapKit(){
        headerView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(35)
            make.trailing.equalToSuperview().inset(35)
            make.height.equalTo(150)
        }
    }
    
    private func cityNameLabelSnapKit(){
        cityNameLabel.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.top).offset(15)
            make.leading.equalTo(headerView.snp.leading).offset(15)
            make.trailing.equalTo(headerView.snp.trailing).inset(15)
        }
    }
    
    private func temperatureLabelSnapKit(){
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(cityNameLabel.snp.bottom).offset(12)
            make.leading.equalTo(headerView.snp.leading).offset(25)
        }
    }
    
    private func iconTemperatureImageViewSnapKit(){
        iconTemperatureImageView.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.top)
            make.trailing.equalTo(headerView.snp.trailing).inset(25)
            make.height.width.equalTo(86)
            make.centerY.equalTo(temperatureLabel.snp.centerY)
            make.leading.equalTo(temperatureLabel.snp.trailing).offset(15)
        }
    }
    
    private func mainStackViewSnapKit(){
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(24)
            make.width.equalTo(206)
            make.centerX.equalToSuperview()
        }
    }
    
    private func hourlyForecastLabelSnapKit(){
        hourlyForecastLabel.snp.makeConstraints { make in
            make.top.equalTo(mainStackView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
    }
    
    private func hourlyCollectionViewSnapKit(){
        hourlyCollectionView.snp.makeConstraints { make in
            make.top.equalTo(hourlyForecastLabel.snp.bottom).offset(22)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(84)
        }
    }
    
    private func dailyForecastLabelSnapKit(){
        dailyForecastLabel.snp.makeConstraints { make in
            make.top.equalTo(hourlyCollectionView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
    }
    
    private func dailyForecastTableViewSnapKit(){
        dailyForecastTableView.snp.makeConstraints { make in
            make.top.equalTo(dailyForecastLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
    
}
