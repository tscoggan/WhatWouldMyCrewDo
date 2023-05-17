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
    
    let defaultLocation = CLLocationCoordinate2D(latitude: 12.9716, longitude: 77.5946)
      
    func userLocationIsAuthorized() -> Bool {
        let authStatuses: Set = [CLAuthorizationStatus.authorizedAlways,
                                 CLAuthorizationStatus.authorizedWhenInUse]
        return CLLocationManager.locationServicesEnabled() &&
            authStatuses.contains(locationManager.authorizationStatus)
    }
    
    func makeUIView(context: Context) -> MKMapView{
        let mv = MKMapView(frame: .zero)
        checkLocationServices(mv)
        return mv
    }
      
    func checkLocationServices(_ mv: MKMapView) {
      if CLLocationManager.locationServicesEnabled() {
          checkLocationAuthorization(mv)
      } else {
          print("Location services disabled")
      }
    }
    
    func checkLocationAuthorization(_ mv: MKMapView) {
      switch locationManager.authorizationStatus {
        case .authorizedWhenInUse:
          mv.showsUserLocation = true
        case .denied: // Show alert telling users how to turn on permissions
          print("authorizationStatus: denied")
          break
        case .notDetermined:
          locationManager.requestWhenInUseAuthorization()
          mv.showsUserLocation = true
        case .restricted: // Show an alert letting them know what’s up
          print("authorizationStatus: restricted")
          break
        case .authorizedAlways:
          mv.showsUserLocation = true
          break
        @unknown default:
          fatalError("Unknown CLLocationManager.authorizationStatus")
      }
    }

    
    func updateUIView(_ view: MKMapView, context: Context){
        
        var coordinate: CLLocationCoordinate2D {
            switch userLocationIsAuthorized() {
                case true:
                    let location = locationManager.location
                    return location?.coordinate ?? defaultLocation
                case false:
                    return defaultLocation
            }
        }
        
        print("Current location: \(coordinate)")
        
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
