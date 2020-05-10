//
//  DailyWeatherRow.swift
//  WeatherAppTask
//
//  Created by guzzle developer on 09/05/2020.
//  Copyright © 2020 Muhammad Saad Ansari. All rights reserved.
//

import SwiftUI

struct DailyWeatherRow: View {
    private let viewModel: DailyWeatherRowViewModel
    
    init(viewModel: DailyWeatherRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View
    {
        HStack
            {
                VStack
                    {
                        Text("\(viewModel.day)")
                        Text("\(viewModel.month)")
                }
                VStack
                    {
                        Text("\(viewModel.time)")
                        Text("\(viewModel.timeZone)")
                        
                }
                VStack(alignment: .leading)
                {
                    Text("\(viewModel.title)").font(.body)
                    Text("\(viewModel.fullDescription)").font(.footnote).foregroundColor(.gray)
                }.padding(.leading, 8)
                Spacer()
                Text("\(viewModel.temperature)°").font(.title)
        }
    }
}
