//
//  WeatherView.swift
//  Animate-WeatherApp
//
//  Created by A'zamjon Abdumuxtorov on 28/08/24.
//

import SwiftUI

struct WeatherView: View {
    @State var searchText = ""
    
    var serachResult: [Forecast] {
        if searchText.isEmpty{
            return Forecast.cities
        }else{
            return Forecast.cities.filter{ $0.location.contains(searchText)}
        }
    }
    
    var body: some View {
        ZStack{
            //MARK: Background
            Color.background.ignoresSafeArea()
            
            ScrollView(showsIndicators:false){
                VStack(spacing:20){
                    ForEach(serachResult){ forecast in
                        WeatherWidget(forecast: forecast)
                    }
                }
            }
            .safeAreaInset(edge: .top) {
                EmptyView()
                    .frame(height: 110)
            }
        }
        .overlay{
            NavigationBar(searchText: $searchText)
        }
        .navigationBarHidden(true)

    }
}

#Preview {
    NavigationView {
        WeatherView()
            .preferredColorScheme(.dark)
    }
}
