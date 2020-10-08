//
//  COVIDFetchRequest.swift
//  covidStats
//
//  Created by Levi Davis on 9/29/20.
//  Copyright © 2020 Levi Davis. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class COVIDFetchRequest: ObservableObject {
    @Published var allCountries = [CountryData]()
    @Published var totalData: TotalData = testTotalData
    
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
        "x-rapidapi-key": "\(Secret.apiKey)"
    ]
    
    init() {
        getCurrentTotal()
    }
    
    func getCurrentTotal() {

        AF.request("https://covid-19-data.p.rapidapi.com/totals?format=json", headers: headers).responseJSON { response in
            print(response)
            guard let result = response.data else {print("No data"); return}
            let json = JSON(result)
            
            let confirmed = json[0]["confirmed"].intValue
            let recovered = json[0]["recovered"].intValue
            let deaths = json[0]["deaths"].intValue
            let critical = json[0]["critical"].intValue
         
            self.totalData = TotalData(confirmed: confirmed, critical: critical, deaths: deaths, recovered: recovered)
        }
    }
    
//    func getAllCountries() {
//        AF.request("", headers: headers).responseJSON { (response) in
//            <#code#>
//        }
//    }
}
