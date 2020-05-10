//
//  WeatherAppTaskTests.swift
//  WeatherAppTaskTests
//
//  Created by guzzle developer on 09/05/2020.
//  Copyright © 2020 Muhammad Saad Ansari. All rights reserved.
//

import XCTest
import Combine
import SwiftUI

@testable import WeatherAppTask

class WeatherAppTaskTests: XCTestCase {

    override func setUpWithError() throws {
            // Put setup code here. This method is called before the invocation of each test method in the class.
        }
        
        override func tearDownWithError() throws {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
        }
        
        func testExample() throws {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct results.
            
            // Check for Date Formatters
            checkForDateFormatter(dateString: "2020-05-10 03:00:00")
            
            // Check if user types more then 3 and less then 7 cities
            checkIfCityTextFieddHasMin3_OR_Max7Cities(cityString: "Dubai,Paris,London")
            
            // Check for Current Weather API
            checkWeatherAPI_CurrentWeather(cityString: "Dubai")
            
            //Check for Forcast Weather API
            checkWeatherAPI_Forecast(cityString : "Dubai")
        }
        
        func testPerformanceExample() throws {
            // This is an example of a performance test case.
            self.measure {
                // Put the code you want to measure the time of here.
            }
        }
        
        func cityTextFieddHasMin3_OR_Max7Cities(cityString : String) -> Bool
        {
            let weatherFetcher = WeatherFetcher()
            let obj = CurrentCityViewModel(weatherFetcher: weatherFetcher)
            return obj.checkCitiesString(forCity: cityString)
        }
        
        func checkIfCityTextFieddHasMin3_OR_Max7Cities(cityString : String) {
            let result = cityTextFieddHasMin3_OR_Max7Cities(cityString: cityString)
            XCTAssert(result, "Inserted string has cities between 3 and 7")
        }
        
        func checkWeatherAPI_CurrentWeather(cityString : String) {
            let weatherFetcher = WeatherFetcher()
            var disposables = Set<AnyCancellable>()
            let expectation = XCTestExpectation(description: "Getting Weather from the provided city")
            weatherFetcher.currentWeatherForecast(forCity: cityString)
                .receive(on: DispatchQueue.main)
                .sink(
                    receiveCompletion: {value in
                        switch value {
                        case .failure: XCTFail()
                        case .finished: expectation.fulfill()
                        }
                },
                    receiveValue: {data in
                        XCTAssertNotNil(data)
                }).store(in: &disposables)
            XCTAssertNotNil(weatherFetcher)
            wait(for: [expectation], timeout: 5.0)
        }
        
        func checkWeatherAPI_Forecast(cityString : String) {
            let weatherFetcher = WeatherFetcher()
            var disposables = Set<AnyCancellable>()
            let expectation = XCTestExpectation(description: "Getting Weather forecast from the provided city")
            weatherFetcher.weeklyWeatherForecast(forCity: cityString)
                .receive(on: DispatchQueue.main)
                .sink(
                    receiveCompletion: {value in
                        switch value {
                        case .failure: XCTFail()
                        case .finished: expectation.fulfill()
                        }
                },
                    receiveValue: {data in
                        XCTAssertNotNil(data)
                }).store(in: &disposables)
            XCTAssertNotNil(weatherFetcher)
            wait(for: [expectation], timeout: 5.0)
        }
        
        func checkForDateFormatter(dateString : String) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            let newDate = dateFormatter.date(from: dateString)!
            
            let timeString = timeFormatter.string(from: newDate)
            XCTAssertNotNil(timeString)
            
            let timeZoneString = timeZoneFormatter.string(from: newDate)
            XCTAssertNotNil(timeZoneString)
            
            let dayString = dayFormatter.string(from: newDate)
            XCTAssertNotNil(dayString)
            
            let monthString = dayFormatter.string(from: newDate)
            XCTAssertNotNil(monthString)
        }
    }
