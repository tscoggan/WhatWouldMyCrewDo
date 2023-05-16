//
//  Maps.swift
//  WhatWouldMyCrewDo
//
//  Created by Tom Scoggan on 5/13/23.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: UIViewRepresentable {
    
    let locationManager = CLLocationManager()
    
    func makeUIView(context: Context) -> MKMapView{
        MKMapView(frame: .zero)
    }
    
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        switch manager.authorizationStatus {
//        case .authorizedWhenInUse:  // Location services are available.
//            //enableLocationFeatures()
//            print("Authorized for location services")
//            break
//
//        case .restricted, .denied:  // Location services currently unavailable.
//            //disableLocationFeatures()
//            print("Not authorized for location services")
//            break
//
//        case .notDetermined:        // Authorization not determined yet.
//           manager.requestWhenInUseAuthorization()
//            break
//
//        default:
//            break
//        }
//    }

    
    func updateUIView(_ view: MKMapView, context: Context){
        let location = locationManager.location
        
        let coordinate = location?.coordinate ?? CLLocationCoordinate2D(latitude: 12.9716, longitude: 77.5946) // default location
        
        let span = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
