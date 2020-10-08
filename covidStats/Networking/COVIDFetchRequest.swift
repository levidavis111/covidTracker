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
        getAllCountries()
    }
    
    func getCurrentTotal() {

        AF.request("https://covid-19-data.p.rapidapi.com/totals?format=json", headers: headers).responseJSON { response in
//            print(response)
            guard let result = response.data else {print("No current total data"); return}
            let json = JSON(result)
            
            let confirmed = json[0]["confirmed"].intValue
            let recovered = json[0]["recovered"].intValue
            let deaths = json[0]["deaths"].intValue
            let critical = json[0]["critical"].intValue
         
            self.totalData = TotalData(confirmed: confirmed, critical: critical, deaths: deaths, recovered: recovered)
        }
    }
    
    func getAllCountries() {
        AF.request("https://covid-19-data.p.rapidapi.com/country/all?format=json", headers: headers).responseJSON { [self] (response) in
            guard let result = response.value else {print("No All Countries Data"); return}
            var allCountryData = [CountryData]()
            guard let dataDict = result as? [[String: Any]] else {print("Could not cast dictionary array"); return}
            
            for countryData in dataDict {
//                print(countryData)
                guard let country = countryData["country"] as? String,
                      let longitude = countryData["longitude"] as? Double,
                      let lattitude = countryData["latitude"] as? Double,
                      let confirmed = countryData["confirmed"] as? Int64,
                      let deaths = countryData["deaths"] as? Int64,
                      let recovered = countryData["recovered"] as? Int64,
                      let critical = countryData["critical"] as? Int64 else {return}
                let countryData = CountryData(country: country, confirmed: confirmed, critical: critical, deaths: deaths, recovered: recovered, longitude: longitude, latitude: lattitude)
                allCountryData.append(countryData)
            }
            self.allCountries = allCountryData.sorted(by: {$0.confirmed > $1.confirmed})
        }
    }
}
