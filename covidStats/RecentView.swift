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
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}
