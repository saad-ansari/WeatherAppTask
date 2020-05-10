//
//  Formatters.swift
//  WeatherAppTask
//
//  Created by guzzle developer on 09/05/2020.
//  Copyright © 2020 Muhammad Saad Ansari. All rights reserved.
//

import Foundation

let dayFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd"
    return formatter
}()

let monthFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM"
    return formatter
}()

let timeFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "h:mm"
    return formatter
}()

let timeZoneFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "a"
    formatter.amSymbol = "AM"
    formatter.pmSymbol = "PM"
    return formatter
}()
