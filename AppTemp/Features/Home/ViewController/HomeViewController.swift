//
//  ViewController.swift
//  AppTemp
//
//  Created by Franklin  Stilhano Solano on 16/04/25.
//
import UIKit

class HomeViewController: UIViewController {
    var screen: HomeScreen?
    private var viewModel = HomeViewModel()
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.setupCollectionViewDelegateAndDataSource(delegate: self, dataSource: self)
        screen?.setupTableViewDelegateAndDataSource(delegate: self, dataSource: self)
        viewModel.delegate = self
        viewModel.fetchData()
        updateBackgroundBasedOnTime()
    }
    
    func updateBackgroundBasedOnTime(){
        let isNight = viewModel.isNightTime()
        screen?.updateBackgroundImage(isNight: isNight)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.collectionViewNumberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyForecastCollectionViewCell.identifier, for: indexPath) as? HourlyForecastCollectionViewCell else {
            return UICollectionViewCell()
        }
        let hour = viewModel.collectionViewCellForItemAt(indexPath: indexPath)
        cell.configure(with: hour)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableViewNumberOfSections
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DailyForecastTableViewCell.identifier, for: indexPath) as? DailyForecastTableViewCell else {
            return UITableViewCell()
        }
        let day = viewModel.tableViewCellForItemAt(indexPath: indexPath)
        cell.configure(with: day)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.tableViewheightForRowAt
    }
    
}

extension HomeViewController: HomeViewModelProtocol {
    func updateUI() {
        screen?.cityNameLabel.text = viewModel.city.name
        screen?.temperatureLabel.text = "\(Int(viewModel.forecastResponse?.current.tempC ?? 0))°C"
        screen?.humidityValueLabel.text = "\(viewModel.forecastResponse?.current.humidity ?? 0)%"
        screen?.windValueLabel.text = "\(viewModel.forecastResponse?.current.windKph ?? 0) km/h"
        screen?.hourlyCollectionView.reloadData()
        screen?.dailyForecastTableView.reloadData()
    }
}
