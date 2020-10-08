//
//  ContentView.swift
//  covidStats
//
//  Created by Levi Davis on 9/29/20.
//  Copyright © 2020 Levi Davis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        TabView {
            RecentView()
                .tabItem {
                    Tab(imageName: "chart.bar", text: "Recent")
                }
                .tag(0)
            
            //Map TK
        }
    }
}

private struct Tab: View {
    let imageName: String
    let text: String
    
    var body: some View {
        
        VStack {
            Image(systemName: imageName)
            Text(text)
        }
    }
}
