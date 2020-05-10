//
//  CurrentCityRow.swift
//  WeatherAppTask
//
//  Created by guzzle developer on 09/05/2020.
//  Copyright © 2020 Muhammad Saad Ansari. All rights reserved.
//

import SwiftUI

struct CurrentCityRow: View {
    private let viewModel: CurrentCityRowViewModel
    
    init(viewModel: CurrentCityRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                HStack {
                    Text("Name:")
                    Text(viewModel.name)
                        .foregroundColor(.gray)
                }
                Spacer()
                
                HStack {
                    VStack {
                        Text("Temperatue")
                        Text("\(viewModel.temperature)°").foregroundColor(.gray)
                    }
                    Spacer()
                    VStack {
                        Text("Max")
                        Text("\(viewModel.maxTemperature)°").foregroundColor(.gray)
                    }
                    Spacer()
                    VStack {
                        Text("Min")
                        Text("\(viewModel.minTemperature)°").foregroundColor(.gray)
                    }
                }
                Spacer()
                
                HStack {
                    Text("Weather:")
                    Text(viewModel.weatherDescription).foregroundColor(.gray)
                }
                Spacer()
                
                HStack {
                    Text("Wind:")
                    Text(viewModel.wind).foregroundColor(.gray)
                }
            }
        }
    }
}
