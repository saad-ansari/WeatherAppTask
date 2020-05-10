//
//  DailyWeatherRowViewModel.swift
//  WeatherAppTask
//
//  Created by guzzle developer on 09/05/2020.
//  Copyright © 2020 Muhammad Saad Ansari. All rights reserved.
//

import Foundation
import SwiftUI

struct DailyWeatherRowViewModel: Identifiable {
    private let item: WeeklyForecastResponse.Item
    
    init(item: WeeklyForecastResponse.Item) {
        self.item = item
    }
    
    var id: String {
        return day + temperature + title
    }
    let dateObj = Date()
    
    var time: String {
        return timeFormatter.string(from: item.date ?? dateObj)
    }
    
    var timeZone: String {
        return timeZoneFormatter.string(from: item.date ?? dateObj)
    }
    
    var day: String {
        return dayFormatter.string(from: item.date ?? dateObj)
    }
    
    var month: String {
        return monthFormatter.string(from: item.date ?? dateObj)
    }
    
    var temperature: String {
        return String(format: "%.1f", item.main?.temp ?? 0.0)
    }
    
    var title: String {
        guard let title = item.weather?.first?.main?.rawValue else { return "" }
        return title
    }
    
    var fullDescription: String {
        guard let description = item.weather?.first?.weatherDescription else { return "" }
        return description
    }
}

// Used to hash on just the day in order to produce a single view model for each
// day when there are multiple items per each day.
extension DailyWeatherRowViewModel: Hashable {
    static func == (lhs: DailyWeatherRowViewModel, rhs: DailyWeatherRowViewModel) -> Bool {
        return lhs.day == rhs.day
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.day)
    }
}
