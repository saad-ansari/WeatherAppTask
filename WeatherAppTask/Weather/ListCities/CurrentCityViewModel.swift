//
//  CurrentCityViewModel.swift
//  WeatherAppTask
//
//  Created by guzzle developer on 09/05/2020.
//  Copyright © 2020 Muhammad Saad Ansari. All rights reserved.
//

import SwiftUI
import Combine

class CurrentCityViewModel: ObservableObject {
    @Published var city: String = ""
    @Published var dataSource: [CurrentCityRowViewModel] = []
    
    let weatherFetcher: WeatherFetchable
    private var disposables = Set<AnyCancellable>()
    
    init(weatherFetcher: WeatherFetchable,scheduler: DispatchQueue = DispatchQueue(label: "CurrentCityViewModel"))
    {
        self.weatherFetcher = weatherFetcher
        $city
            .dropFirst(1)
            .debounce(for: .seconds(0.5), scheduler: scheduler)
            .sink(receiveValue: fetchWeather(forCity:))
            .store(in: &disposables)
    }
    
    func checkCitiesString(forCity textCities : String) -> Bool
    {
        let citiesArray = textCities.components(separatedBy: ",")
        if(citiesArray.count > 2 && citiesArray.count < 8)
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func getCitiesArrayFromString(cityArray array : String) -> [String] {
        return array.components(separatedBy: ",")
    }
    func fetchWeather(forCity city: String)
    {
        DispatchQueue.main.async {
            self.dataSource.removeAll()
        }
        if(checkCitiesString(forCity : city))
        {
            for cityObj in getCitiesArrayFromString(cityArray: city)
            {
                if(!cityObj.isEmpty)
                {
                    fetchWeaterOfEachCity(forCity: cityObj)
                }
            }
        }
    }
    
    func fetchWeaterOfEachCity(forCity city: String)
    {
        weatherFetcher.currentWeatherForecast(forCity: city)
            .map(CurrentCityRowViewModel.init)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    switch value {
                    case .failure:
                        print("error %d",self.dataSource.count)
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] weather in
                    guard let self = self else { return }
                    self.dataSource.append(weather)
            })
            .store(in: &disposables)
    }
}
