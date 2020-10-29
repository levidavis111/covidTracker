//
//  SearchView.swift
//  covidStats
//
//  Created by Levi Davis on 10/29/20.
//  Copyright © 2020 Levi Davis. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    var body: some View {
        
        HStack {
            TextField("Country...", text: $searchText)
                .padding()
        }
        .frame(height: 50)
        .background(Color("cardBackgroundGray"))
    }
}
