//
//  WeeklyWeatherViewModel.swift
//  WeatherAppTask
//
//  Created by guzzle developer on 09/05/2020.
//  Copyright © 2020 Muhammad Saad Ansari. All rights reserved.
//

import SwiftUI
import Combine

class WeeklyWeatherViewModel: ObservableObject {
    @Published var selectedObj: CurrentCityRowViewModel
    @Published var city: String = ""
    @Published var dataSource: [DailyWeatherRowViewModel] = []
    @Published var dataSourceGroup: [DailyWeatherRowViewModel] = []
    var dictionaries = [[String: [DailyWeatherRowViewModel]]]()
    
    private let weatherFetcher: WeatherFetchable
    private var disposables = Set<AnyCancellable>()
    
    init(city: String, weatherFetcher: WeatherFetchable, selectedObj: CurrentCityRowViewModel) {
        self.weatherFetcher = weatherFetcher
        self.city = city
        self.selectedObj = selectedObj
        fetchWeather(forCity: selectedObj.name)
    }
    
    func fetchWeather(forCity city: String) {
        weatherFetcher.weeklyWeatherForecast(forCity: city)
            .map { response in
                response.list?.map(DailyWeatherRowViewModel.init)
        }
        .receive(on: DispatchQueue.main)
        .sink(
            receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.dataSourceGroup = []
                case .finished:
                    break
                }
            },
            receiveValue: { [weak self] forecast in
                guard let self = self else { return }
                self.dataSource = forecast ?? []
                let dictionary = Dictionary(grouping: self.dataSource, by: { (element: DailyWeatherRowViewModel) in
                    return element.day
                })
                
                for number in dictionary
                {
                    let dictionary1: [String: [DailyWeatherRowViewModel]] = [number.key: number.value]
                    self.dictionaries.append(dictionary1)
                }
                
        })
            .store(in: &disposables)
    }
}
