//
//  HomeViewModel.swift
//  AppTemp
//
//  Created by Franklin  Stilhano Solano on 17/04/25.
//

import Foundation

protocol HomeViewModelProtocol {
    func teste()
}

class HomeViewModel {
    var delegate: HomeViewModelProtocol?
    
     var service = ServiceHome()
    var city = City(lat: "-23.6814346", lon: "-46.9249599", name: "São Paulo")
    var listCollectionView: [ForecastResponse] = []
    var listTableView: [ForecastResponse] = []
    var forecastResponse: ForecastResponse?
    
    
    func fetchData() {
        service.fecthData(city: city) { [weak self] response in
            print("response: \(String(describing: response))")
            self?.forecastResponse = response
            DispatchQueue.main.async {
                self?.loadData()
            }
         
        }
        
}

    func loadData(){
        delegate?.teste()
    }
    
    var collectionViewNumberOfSections: Int {
        return 10 //list.count
    }
    
    func collectionViewCellForItemAt(indexPath: IndexPath) -> ForecastResponse {
        return listCollectionView[indexPath.row]
    }
    
    var tableViewNumberOfSections: Int {
        return 10
    }
    
    func tableViewCellForItemAt(indexPath: IndexPath) -> ForecastResponse {
        return listTableView[indexPath.row]
    }
    
}
