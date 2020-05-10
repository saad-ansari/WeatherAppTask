//
//  Array+Filtering.swift
//  WeatherAppTask
//
//  Created by guzzle developer on 09/05/2020.
//  Copyright © 2020 Muhammad Saad Ansari. All rights reserved.
//

import Foundation

public extension Array where Element: Hashable {
    static func removeDuplicates(_ elements: [Element]) -> [Element]
    {
        var seen = Set<Element>()
        return elements.filter{ seen.insert($0).inserted }
    }
}
