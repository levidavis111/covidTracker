//
//  CountryDetailView.swift
//  covidStats
//
//  Created by Levi Davis on 10/29/20.
//  Copyright © 2020 Levi Davis. All rights reserved.
//

import SwiftUI

struct CountryDetailView: View {
    
    var countryData: CountryData
    
    var body: some View {
        VStack {
            VStack {
                CountryDetailRowView(number: countryData.confirmed.formatNumber(), name: "Confirmed")
                    .padding(.top)
                CountryDetailRowView(number: countryData.critical.formatNumber(), name: "Critical", color: .yellow)
                CountryDetailRowView(number: countryData.deaths.formatNumber(), name: "Deaths", color: .red)
                CountryDetailRowView(number: String(format: "%.2f", countryData.fatalityRate), name: "Death%", color: .red)
                CountryDetailRowView(number: countryData.recovered.formatNumber(), name: "Recovered", color: .green)
                CountryDetailRowView(number: String(format: "%.2f", countryData.recoveredRate), name: "Recovered%", color: .green)
            }
            .background(Color("cardBackgroundGray"))
            .cornerRadius(8)
            .padding()
            
            Spacer()
        }
        .padding(.top, 50)
        .navigationBarTitle(countryData.country)
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(countryData: testCountryData)
    }
}
