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
    
    @EnvironmentObject var currentState: CurrentState
    
    let locationManager = CLLocationManager()
    
    let locMgrDelegate = LocationMgrDelegate()
    
    let defaultLocation = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    func makeUIView(context: Context) -> MKMapView {
        locMgrDelegate.setMapView(self)
        locationManager.delegate = locMgrDelegate
        let mv =  MKMapView(frame: .zero)
        locMgrDelegate.setMKMapView(mv)
        return mv
    }
    
    func updateUIView(_ view: MKMapView, context: Context){
        
        var coordinate: CLLocationCoordinate2D {
            switch currentState.userLocationIsAuthorized {
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
    
    func setUserLocationAuth(_ isAuthorized: Bool) {
        currentState.userLocationIsAuthorized = isAuthorized
    }
    
}

class LocationMgrDelegate: NSObject, CLLocationManagerDelegate {
    
    @EnvironmentObject var currentState: CurrentState
    
    var mapView: MapView?
    
    var mv: MKMapView?
    
    func setMapView(_ mv: MapView) {
        self.mapView = mv
    }
    
    func setMKMapView(_ mv: MKMapView) {
        self.mv = mv
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if CLLocationManager.locationServicesEnabled() {
            switch mapView!.locationManager.authorizationStatus {
              case .authorizedWhenInUse:
                mapView!.setUserLocationAuth(true)
                mv?.showsUserLocation = true
              case .denied: // Show alert telling users how to turn on permissions
                print("authorizationStatus: denied")
                mapView!.setUserLocationAuth(false)
                break
              case .notDetermined:
                mapView!.locationManager.requestWhenInUseAuthorization()
                break
              case .restricted: // Show an alert letting them know what’s up
                print("authorizationStatus: restricted")
                mapView!.setUserLocationAuth(false)
                break
              case .authorizedAlways:
                mapView!.setUserLocationAuth(true)
                mv!.showsUserLocation = true
                break
              @unknown default:
                fatalError("Unknown CLLocationManager.authorizationStatus")
            }
        } else {
            mapView!.setUserLocationAuth(false)
            print("Location services disabled")
        }
    }
    
}
