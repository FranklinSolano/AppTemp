//
//  HomeViewModel.swift
//  AppTemp
//
//  Created by Franklin  Stilhano Solano on 17/04/25.
//
import Foundation

protocol HomeViewModelProtocol: AnyObject {
    func updateUI()
}

class HomeViewModel {
    weak var delegate: HomeViewModelProtocol?
    var service = ServiceHome()
    var city = City(lat: "-23.52278", lon: "-46.18833", name: "Mogi das cruzes")
    
    var forecastResponse: ForecastResponse?
    var hourlyForecasts: [ForecastResponse.Hour] = []
    var dailyForecasts: [ForecastResponse.ForecastDay] = []
    
    func fetchData() {
        service.fetchData(city: city) { [weak self] response in
            guard let self = self else { return }
            self.forecastResponse = response
            print("Resposta: \(String(describing: response))")
            
            // Preencher listas para CollectionView e TableView
            if let forecast = response?.forecast {
                // Filtrar horas futuras (próximas 12 horas)
                let currentTime = Date().timeIntervalSince1970
                var futureHours: [ForecastResponse.Hour] = []
                
                // Coletar horas de todos os dias
                for day in forecast.forecastday {
                    let hours = day.hour.filter { hour in
                        Double(hour.timeEpoch) >= currentTime
                    }
                    futureHours.append(contentsOf: hours)
                }
                
                // Limitar a 12 horas
                self.hourlyForecasts = Array(futureHours.prefix(12))
                
                // Filtrar dias a partir de hoje
                let today = Calendar.current.startOfDay(for: Date()).timeIntervalSince1970
                self.dailyForecasts = forecast.forecastday.filter { day in
                    Double(day.dateEpoch) >= today
                }
                
                // Log para verificar horas e dias
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
                formatter.locale = Locale(identifier: "pt_BR")
                formatter.timeZone = TimeZone(identifier: "America/Sao_Paulo")
                print("Horas filtradas:")
                for hour in self.hourlyForecasts {
                    let date = Date(timeIntervalSince1970: TimeInterval(hour.timeEpoch))
                    print("Hora: \(formatter.string(from: date))")
                }
                print("Dias filtrados:")
                for day in self.dailyForecasts {
                    let date = Date(timeIntervalSince1970: TimeInterval(day.dateEpoch))
                    print("Dia: \(formatter.string(from: date))")
                }
            }
            
            DispatchQueue.main.async {
                self.delegate?.updateUI()
            }
        }
    }
    
    var collectionViewNumberOfSections: Int {
        return hourlyForecasts.count
    }
    
    func collectionViewCellForItemAt(indexPath: IndexPath) -> ForecastResponse.Hour {
        return hourlyForecasts[indexPath.row]
    }
    
    var tableViewNumberOfSections: Int {
        return dailyForecasts.count
    }
    
    func tableViewCellForItemAt(indexPath: IndexPath) -> ForecastResponse.ForecastDay {
        return dailyForecasts[indexPath.row]
    }
    
    var tableViewheightForRowAt: CGFloat {
        return 55
    }
    
    func isNightTime() -> Bool {
        let hour = Calendar.current.component(.hour, from: Date())
        return hour < 6 || hour >= 18
    }

    
}
