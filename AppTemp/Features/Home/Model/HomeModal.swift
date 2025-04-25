//
//  City.swift
//  AppTemp
//
//  Created by Franklin  Stilhano Solano on 17/04/25.
//

import Foundation

struct City {
    let lat: String
    let lon: String
    let name: String
}

// MARK: - ForecastResponse
struct ForecastResponse: Codable {
    let current: Current
    let forecast: Forecast
    
    struct Current: Codable {
        let tempC: Double
        let humidity: Int
        let windKph: Double
        let condition: Condition
        
        enum CodingKeys: String, CodingKey {
            case tempC = "temp_c"
            case humidity
            case windKph = "wind_kph"
            case condition
        }
    }
    
    struct Forecast: Codable {
        let forecastday: [ForecastDay]
    }
    
    struct ForecastDay: Codable {
        let dateEpoch: Int
        let day: Day
        let hour: [Hour]
        
        enum CodingKeys: String, CodingKey {
            case dateEpoch = "date_epoch"
            case day, hour
        }
    }
    
    struct Day: Codable {
        let maxTempC: Double
        let minTempC: Double
        let condition: Condition
        
        enum CodingKeys: String, CodingKey {
            case maxTempC = "maxtemp_c"
            case minTempC = "mintemp_c"
            case condition
        }
    }
    
    struct Hour: Codable {
        let timeEpoch: Int
        let tempC: Double
        let condition: Condition
        let windKph: Double
        let humidity: Int
        
        enum CodingKeys: String, CodingKey {
            case timeEpoch = "time_epoch"
            case tempC = "temp_c"
            case condition
            case windKph = "wind_kph"
            case humidity
        }
    }
    
    struct Condition: Codable {
        let text: String
        let icon: String
        let code: Int
    }
}
