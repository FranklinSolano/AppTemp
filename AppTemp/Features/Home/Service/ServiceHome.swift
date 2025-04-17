//
//  ServiceHome.swift
//  AppTemp
//
//  Created by Franklin  Stilhano Solano on 17/04/25.
//

import Foundation

class ServiceHome {
    private let baseURL: String = "https://api.openweathermap.org/data/3.0/onecall"
    private let apiKey: String = "4ea983345b51a8352dd260f9b20b3be1"
    private let session = URLSession.shared
    
    func fechtData(city: City, _ completion: @escaping (ForecastResponse?) -> Void) {
        let urlString = "\(baseURL)?lat=\(city.lat)&lon=\(city.lon)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else { return }
        
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                print("✅ JSON recebido: \(json)")
                
                let forecastResponse = try JSONDecoder().decode(ForecastResponse.self, from: data)
                completion(forecastResponse)
            } catch {
                print("❌ Erro no decode: \(error)")
                completion(nil)
            }
        }
        task.resume()
    }
}


