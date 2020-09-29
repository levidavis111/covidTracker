//
//  CountryData.swift
//  covidStats
//
//  Created by Levi Davis on 9/29/20.
//  Copyright © 2020 Levi Davis. All rights reserved.
//

import Foundation

struct CountryData {
    
    let country: String
    let confirmed: Int64
    let critical: Int64
    let deaths: Int64
    let recovered: Int64
    let longitude: Double
    let latitude: Double
    
    var fatalityRate: Double {
        return (100 * Double(deaths)) / Double(confirmed)
    }
    var recoveredRate: Double {
        return (100 * Double(recovered)) / Double(confirmed)
    }
}

let testCountryData = CountryData(country: "Test", confirmed: 1, critical: 0, deaths: 0, recovered: 0, longitude: 0.0, latitude: 0.0)
