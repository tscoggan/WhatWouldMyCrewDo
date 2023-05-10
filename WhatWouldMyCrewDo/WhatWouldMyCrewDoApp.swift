//
//  WhatWouldMyCrewDoApp.swift
//  WhatWouldMyCrewDo
//
//  Created by Tom Scoggan on 5/10/23.
//

import SwiftUI

@main
struct WhatWouldMyCrewDoApp: App {
    
    @State var currentView: ViewType = .MainView
    
    var body: some Scene {
        WindowGroup {
            switch currentView {
                case .MainView:
                    MainView()

                case .RateAndReviewView:
                    RateAndReviewView()

                case .PlanTripView:
                    PlanTripView()
              
                case .ManageFriendsGroupView:
                    ManageFriendsGroupView()
                    
                case .ShareItineraryView:
                    ShareItineraryView()
            }
        }
    }
}
