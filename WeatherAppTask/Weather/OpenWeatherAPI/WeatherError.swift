//
//  WeatherError.swift
//  WeatherAppTask
//
//  Created by guzzle developer on 09/05/2020.
//  Copyright © 2020 Muhammad Saad Ansari. All rights reserved.
//

import Foundation

enum WeatherError: Error {
    case parsing(description: String)
    case network(description: String)
}
