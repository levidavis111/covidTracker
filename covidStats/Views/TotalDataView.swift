//
//  TotalDataView.swift
//  covidStats
//
//  Created by Levi Davis on 10/21/20.
//  Copyright © 2020 Levi Davis. All rights reserved.
//

import SwiftUI

struct TotalDataView: View {
    
    var totaldata: TotalData
    
    var body: some View {
        
        VStack {
            
            HStack {
                TotalDataCardView(number: totaldata.confirmed.formatNumber(), name: "Confirmed", color: .primary)
                TotalDataCardView(number: totaldata.critical.formatNumber(), name: "Critical", color: .yellow)
                TotalDataCardView(number: totaldata.deaths.formatNumber(), name: "Deaths", color: .red)
            }
            HStack {
                TotalDataCardView(number: String(format: "%.2f", totaldata.fatalityRate), name: "Death%", color: .red)
                TotalDataCardView(number: totaldata.critical.formatNumber(), name: "Recovered", color: .green)
                TotalDataCardView(number: String(format: "%.2f", totaldata.recoveredRate), name: "Recovery%", color: .green)
            }
        }
        .frame(height: 170)
        .padding(10)
        
    }
}

struct TotalDataView_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataView(totaldata: testTotalData)
    }
}
