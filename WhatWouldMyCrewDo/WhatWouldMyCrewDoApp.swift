//
//  WhatWouldMyCrewDoApp.swift
//  WhatWouldMyCrewDo
//
//  Created by Tom Scoggan on 5/10/23.
//

import SwiftUI

@main
struct WhatWouldMyCrewDoApp: App {
    
    @StateObject var currentState: CurrentState = CurrentState()
    
    var body: some Scene {
        WindowGroup {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("What Would My Crew Do?").padding()
                
                currentView()
            }.environmentObject(currentState)
        }
    }
    
    func currentView() -> AnyView {
        switch currentState.currentView {
            case ViewType.MainView:
                return AnyView(MainView())
                
            case ViewType.RateAndReviewView:
                return AnyView(RateAndReviewView())
                
            case ViewType.PlanTripView:
                return AnyView(PlanTripView())
                
            case ViewType.ManageFriendsGroupView:
                return AnyView(ManageFriendsGroupView())
                
            case ViewType.ShareItineraryView:
                return AnyView(ShareItineraryView())
        }
    }
}
