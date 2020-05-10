//
//  WeeklyForecastResponse.swift
//  WeatherAppTask
//
//  Created by guzzle developer on 09/05/2020.
//  Copyright © 2020 Muhammad Saad Ansari. All rights reserved.
//

import Foundation

struct WeeklyForecastResponse: Codable {
    let list: [Item]?
    
    struct Item: Codable {
        let date: Date?
        let main: MainClass?
        let weather: [Weather]?
        
        enum CodingKeys: String, CodingKey {
            case date = "dt"
            case main
            case weather
        }
    }
    
    struct MainClass: Codable {
        let temp: Double?
    }
    
    struct Weather: Codable {
        let main: MainEnum?
        let weatherDescription: String?
        
        enum CodingKeys: String, CodingKey {
            case main
            case weatherDescription = "description"
        }
    }
    
    enum MainEnum: String, Codable {
        case clear = "Clear"
        case clouds = "Clouds"
        case rain = "Rain"
    }
}

struct CurrentWeatherForecastResponse: Decodable {
    let coord: Coord?
    let name: String?
    let main: Main?
    let wind: Wind?
    let weather: [Weather]?
    
    struct Main: Codable {
        let temperature: Double?
        let humidity: Int?
        let maxTemperature: Double?
        let minTemperature: Double?
        
        enum CodingKeys: String, CodingKey {
            case temperature = "temp"
            case humidity = "humidity"
            case maxTemperature = "temp_max"
            case minTemperature = "temp_min"
        }
    }
    
    struct Coord: Codable {
        let lon: Double?
        let lat: Double?
    }
    
    struct Wind: Codable {
        let speed: Double?
        let deg: Double?
    }
    
    struct Weather: Codable {
        let main: String?
        let weatherDescription: String?
        
        enum CodingKeys: String, CodingKey {
            case main
            case weatherDescription = "description"
        }
    }
}
