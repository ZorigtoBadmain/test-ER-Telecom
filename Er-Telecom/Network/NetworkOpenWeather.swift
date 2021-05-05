//
//  NetworkOpenWeather.swift
//  Er-Telecom
//
//  Created by Зоригто Бадмаин on 05.05.2021.
//

import Foundation
import Alamofire

class AlamoWeek {
    
    static let shared = AlamoWeek()
    
    func loadWeekAlamo(completion: @escaping(WeekCurrentWeatherData) -> Void) {
        
        AF.request("https://api.openweathermap.org/data/2.5/forecast?q=Moscow,us&appid=d7ec9855a92e87e2705a78cc9f96846a&units=metric").responseJSON { (response) in
            guard let data = response.data else { return }
            let decoder = JSONDecoder()
            do {
                let weekCurrentWeatherData = try decoder.decode(WeekCurrentWeatherData.self, from: data)
                
                DispatchQueue.main.async {
                    completion(weekCurrentWeatherData)
                }
            } catch {
                print(error)
            }
        }
    }
}

