//
//  WeekCurrentWeather.swift
//  Er-Telecom
//
//  Created by Зоригто Бадмаин on 05.05.2021.
//

import Foundation

struct WeekCurrentWeather: Codable {
    let temp: Double
    var tempString: String {
        return String(format: "%.0f", temp)
    }
    
    let conditionCode: Int
    var systemIconNameString: String {
        switch conditionCode {
        case 200...232: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 701...781: return "smoke.fill"
        case 800: return "sun.min.fill"
        case 801...804: return "cloud.fill"
        default:
            return "nosign"
        }
    }
    
    init?(weekCurrentWeatherData: WeekCurrentWeatherData) {
        temp = weekCurrentWeatherData.list.first!.main.temp
        conditionCode = weekCurrentWeatherData.list.first!.weather.first!.id
    }
}
