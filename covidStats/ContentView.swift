//
//  ContentView.swift
//  covidStats
//
//  Created by Levi Davis on 9/29/20.
//  Copyright © 2020 Levi Davis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var covidFetch = COVIDFetchRequest()
    
    var body: some View {
        Text("\(covidFetch.totalData.confirmed)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
