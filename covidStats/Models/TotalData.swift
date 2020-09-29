//
//  TotalData.swift
//  covidStats
//
//  Created by Levi Davis on 9/29/20.
//  Copyright © 2020 Levi Davis. All rights reserved.
//

import Foundation

struct TotalData {
    
    let confirmed: Int
    let critical: Int
    let deaths: Int
    let recovered: Int
    
    var fatalityRate: Double {
        return (100 * Double(deaths)) / Double(confirmed)
    }
    var recoveredRate: Double {
        return (100 * Double(recovered)) / Double(confirmed)
    }
}

let testTotalData = TotalData(confirmed: 1, critical: 0, deaths: 0, recovered: 0)
