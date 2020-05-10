//
//  CurrentCityRowViewModel.swift
//  WeatherAppTask
//
//  Created by guzzle developer on 09/05/2020.
//  Copyright © 2020 Muhammad Saad Ansari. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit

struct CurrentCityRowViewModel:  Identifiable  {
    private let item: CurrentWeatherForecastResponse
    
    init(item: CurrentWeatherForecastResponse) {
        self.item = item
    }
    
    var id: String {
        return temperature + maxTemperature + wind
    }
    
    var name: String {
        return item.name ?? ""
    }
    
    var temperature: String {
        return String(format: "%.1f", item.wind?.speed ?? 0)
    }
    
    var maxTemperature: String {
        return String(format: "%.1f", item.main?.maxTemperature ?? 0.0)
    }
    
    var minTemperature: String {
        return String(format: "%.1f", item.main?.minTemperature ?? 0.0)
    }
    
    var weatherDescription: String {
        return item.weather?[0].weatherDescription ?? ""
    }
    
    var wind: String {
        return String(format: "%.1f", item.wind?.speed ?? 0.0)
    }
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D.init(latitude: item.coord?.lat ?? 0.0, longitude: item.coord?.lon ?? 0.0)
    }
}
