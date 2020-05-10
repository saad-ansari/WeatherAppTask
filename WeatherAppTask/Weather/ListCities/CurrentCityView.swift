//
//  CurrentCityView.swift
//  WeatherAppTask
//
//  Created by guzzle developer on 09/05/2020.
//  Copyright © 2020 Muhammad Saad Ansari. All rights reserved.
//

import SwiftUI

struct CurrentCityView: View {
    @ObservedObject var viewModel: CurrentCityViewModel
    
    init(viewModel: CurrentCityViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                searchField
                if viewModel.dataSource.isEmpty {
                    emptySection
                } else {
                    forecastSection
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Weather ⛅️")
        }
    }
}

private extension CurrentCityView {
    
    var searchField: some View {
        HStack(alignment: .center) {
            TextField("e.g. Cupertino", text: $viewModel.city)
        }
    }
    var forecastSection: some View {
        Section{
            ForEach(self.viewModel.dataSource) { result in
                NavigationLink(destination: WeeklyWeatherView(viewModel:  WeeklyWeatherViewModel(city: self.viewModel.city,weatherFetcher:self.viewModel.weatherFetcher,selectedObj: result)))
                {
                    CurrentCityRow.init(viewModel:result)
                }
            }
        }
    }
    
    var emptySection: some View {
        Section {
            Text("No results")
                .foregroundColor(.gray)
        }
    }
}
