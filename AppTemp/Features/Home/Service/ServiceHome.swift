//
//  ServiceHome.swift
//  AppTemp
//
//  Created by Franklin  Stilhano Solano on 17/04/25.
//
import Foundation

class ServiceHome {
    
    private let baseURL: String = "https://api.openweathermap.org/data/2.5/onecall"
    private let apiKey: String = "5583802543c197e3e6fdfe843aa241c6"
    
    private let session = URLSession.shared
    
    func fecthData(city: City, _ completion: @escaping (ForecastResponse?) -> Void) {
        let urlString = "\(baseURL)?lat=\(city.lat)&lon=\(city.lon)&appid=\(apiKey)&units=metric"
        print("tessres----------------------------------------------------\(urlString)")
        guard let url = URL(string: urlString) else { return }
        print("tessres\(url)")

        let task = session.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(nil)
                return
            }
            
            do {
                let forecastResponse = try JSONDecoder().decode(ForecastResponse.self, from: data)
                completion(forecastResponse)
            } catch {
                print(error)
                completion(nil)
            }
        }
        
        task.resume()
    }
    
}
