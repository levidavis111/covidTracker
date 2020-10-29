//
//  MapView.swift
//  covidStats
//
//  Created by Levi Davis on 10/29/20.
//  Copyright © 2020 Levi Davis. All rights reserved.
//

import SwiftUI
import UIKit
import MapKit

struct MapView: UIViewRepresentable {
    
    @Binding var countryData: [CountryData]
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        var allAnnotations = [CoronaCaseAnnotation]()
        
        for data in countryData {
            let title = "\(data.country)\n Confirmed: \(data.confirmed)\n Deaths: \(data.deaths)"
            let coordinate = CLLocationCoordinate2DMake(data.latitude, data.longitude)
            let annotation = CoronaCaseAnnotation(title: title, coordinate: coordinate)
            allAnnotations.append(annotation)
        }
        uiView.annotations.forEach {uiView.removeAnnotation($0)}
        uiView.addAnnotations(allAnnotations)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        return MKMapView()
    }
    
}

class CoronaCaseAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
