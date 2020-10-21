//
//  CountryDataRowView.swift
//  covidStats
//
//  Created by Levi Davis on 10/8/20.
//  Copyright © 2020 Levi Davis. All rights reserved.
//

import SwiftUI

struct CountryDataRowView: View {
    
    var countryData: CountryData
    
    var body: some View {
        HStack{
            Text(countryData.country)
                .fontWeight(.medium)
                .font(.subheadline)
                .frame(width: 50, alignment: .leading)
                .lineLimit(2)
            
            Spacer()
            
            Text(countryData.confirmed.formatNumber())
                .font(.subheadline)
                .frame(height: 40)
                .padding(.leading, 5)
            
            Spacer()
            
            Text(countryData.deaths.formatNumber())
                .frame(width: 55, height: 40, alignment: .center)
                .font(.subheadline)
                .padding(.leading, 5)
                .foregroundColor(.red)
            
            Spacer()
            
            Text(countryData.recovered.formatNumber())
                .frame(width: 70, height: 40, alignment: .center)
                .font(.subheadline)
                .foregroundColor(.green)
        }
    }
}

struct CountryDataRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDataRowView(countryData: testCountryData)
    }
}
