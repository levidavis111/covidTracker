//
//  MapContainerView.swift
//  covidStats
//
//  Created by Levi Davis on 10/29/20.
//  Copyright © 2020 Levi Davis. All rights reserved.
//

import SwiftUI

struct MapContainerView: View {
    @ObservedObject var covidFetch = COVIDFetchRequest()
    
    var body: some View {
        MapView(countryData: $covidFetch.allCountries)
    }
}

struct MapContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MapContainerView()
    }
}
