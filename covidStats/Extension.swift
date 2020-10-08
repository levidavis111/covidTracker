//
//  Extension.swift
//  covidStats
//
//  Created by Levi Davis on 10/8/20.
//  Copyright © 2020 Levi Davis. All rights reserved.
//

import Foundation

extension Int {
    func formatNumber() -> String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self)) ?? "error"
    }
}

extension Int64 {
    func formatNumber() -> String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self)) ?? "error"
    }
}
