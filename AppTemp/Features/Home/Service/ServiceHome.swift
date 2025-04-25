//
//  ServiceHome.swift
//  AppTemp
//
//  Created by Franklin  Stilhano Solano on 17/04/25.
//
import Foundation

class ServiceHome {
    private let baseURL: String = "https://api.weatherapi.com/v1/forecast.json"
    private let apiKey: String = "628ee94eb3df47aa98310006251804"
    private let session = URLSession.shared
    
    func fetchData(city: City, _ completion: @escaping (ForecastResponse?) -> Void) {
        let urlString = "\(baseURL)?key=\(apiKey)&q=\(city.lat),\(city.lon)&days=7&aqi=no&alerts=no&lang=pt"
        print("URL: \(urlString)")
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Erro: Sem dados")
                completion(nil)
                return
            }
            
            do {
                let forecastResponse = try JSONDecoder().decode(ForecastResponse.self, from: data)
                completion(forecastResponse)
            } catch {
                print("Erro ao decodificar: \(error)")
                completion(nil)
            }
        }
        task.resume()
    }
}
