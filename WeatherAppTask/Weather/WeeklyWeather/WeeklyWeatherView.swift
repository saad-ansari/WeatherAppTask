//
//  WeeklyWeatherView.swift
//  WeatherAppTask
//
//  Created by guzzle developer on 09/05/2020.
//  Copyright © 2020 Muhammad Saad Ansari. All rights reserved.
//

import SwiftUI

struct WeeklyWeatherView: View {
    
    @ObservedObject var viewModel: WeeklyWeatherViewModel
    
    init(viewModel: WeeklyWeatherViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View
    {
        
        VStack(alignment: .leading)
        {
            MapView(coordinate: viewModel.selectedObj.coordinate)
                .cornerRadius(25)
                .frame(height: 300)
                .disabled(true)
            
            
            
            VStack(alignment: .leading)
            {
                NavigationView
                    {
                        List
                            {
                                if viewModel.dataSource.isEmpty
                                {
                                    emptySection
                                }
                                else
                                {
                                    forecastSection
                                }
                        }.listStyle(GroupedListStyle())
                            .navigationBarTitle("Weather Forcast ⛅️")
                }
            }
        }.navigationBarTitle(viewModel.selectedObj.name)
    }
}

private extension WeeklyWeatherView
{
    var forecastSection: some View
    {
        Section {
            ForEach(self.viewModel.dataSource, content: DailyWeatherRow.init(viewModel:))
        }
    }
    
    var emptySection: some View {
        Section {
            Text("No results").foregroundColor(.gray)
        }
    }
}
