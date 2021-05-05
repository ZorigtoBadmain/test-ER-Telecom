//
//  WeekCurrentWeatherData.swift
//  Er-Telecom
//
//  Created by Зоригто Бадмаин on 05.05.2021.
//

import Foundation

struct WeekCurrentWeatherData: Codable {
    
    let list: [List]
    
    func oneDay() -> [List] {
        var arrayList = [List]()
        
        for item in list {
            if item.dt_txt.components(separatedBy: " ")[1] == "12:00:00" {
                arrayList.append(item)
            }
        }
        return arrayList
    }
}

struct List: Codable {
    
    let main: MainClass
    let weather: [WeatherWeek]
    let dt_txt: String
    
    
}

struct MainClass: Codable {
    let temp: Double
}

struct WeatherWeek: Codable{
    let id: Int

}
