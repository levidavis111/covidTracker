//
//  CountryDetailRowView.swift
//  covidStats
//
//  Created by Levi Davis on 10/29/20.
//  Copyright © 2020 Levi Davis. All rights reserved.
//

import SwiftUI

struct CountryDetailRowView: View {
    
    var number: String = "Error"
    var name: String = "Confirmed"
    var color: Color = .primary
    
    var body: some View {
        VStack {
            
            HStack {
                Text(self.name)
                    .font(.body)
                    .padding(5)
                
                Spacer()
                
                Text(self.number)
                    .font(.subheadline)
                    .padding(5)
                    .foregroundColor(color)
            }
            Divider()
        }
        .padding(.leading)
        .padding(.trailing)
    }
}

struct CountryDetailRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailRowView()
    }
}
