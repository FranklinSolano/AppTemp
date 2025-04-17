//
//  ViewController.swift
//  AppTemp
//
//  Created by Franklin  Stilhano Solano on 16/04/25.
//

import UIKit

class HomeViewController: UIViewController {

    var screen: HomeScreen?
    private let service = ServiceHome()
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
    }


}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.collectionViewNumberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyForecastCollectionViewCell.indentifier, for: indexPath) as? HourlyForecastCollectionViewCell
        return cell ?? UICollectionViewCell()
    }
    
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableViewNumberOfSections
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyForecastTableViewCell.indentifier, for: indexPath) as? DailyForecastTableViewCell
        return cell ?? UITableViewCell()
    }
    
    
}

extension HomeViewController: HomeViewModelProtocol {
    func teste() {
        print(viewModel.forecastResponse ?? "f")
        print(viewModel.forecastResponse?.current.temp ?? "fff")
        screen?.cityNameLabel.text = viewModel.city.name
        screen?.temperatureLabel.text = "\(Int(viewModel.forecastResponse?.current.temp ?? 0))C"
    }
    
    
}
