//
//  RecentView.swift
//  covidStats
//
//  Created by Levi Davis on 10/8/20.
//  Copyright © 2020 Levi Davis. All rights reserved.
//

import SwiftUI

struct RecentView: View {
    
    @ObservedObject var covidFetch = COVIDFetchRequest()
    @State var searchText = ""
    @State var isSearchVisible = false
    
    var body: some View {
        NavigationView {
            VStack {
                if isSearchVisible {
                    SearchView(searchText: $searchText)
                }
                
                TotalDataView(totaldata: covidFetch.totalData)
                ListHeaderView()
                List {
                    ForEach(covidFetch.allCountries.filter {
                        self.searchText.isEmpty ? true : $0.country.lowercased().contains(self.searchText.lowercased())
                    }, id: \.country) {countryData in
                        CountryDataRowView(countryData: countryData)
                    }
                }
            }//End VStack
            .navigationBarTitle("Recent Data", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.isSearchVisible.toggle()
                                        if !self.isSearchVisible {
                                            self.searchText = ""
                                        }
                                    }, label: {
                                        Image(systemName: "magnifyingglass")
                                    })
            )
        }//End Nav
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}
