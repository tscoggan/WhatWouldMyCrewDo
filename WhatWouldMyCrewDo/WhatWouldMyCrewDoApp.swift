//
//  WhatWouldMyCrewDoApp.swift
//  WhatWouldMyCrewDo
//
//  Created by Tom Scoggan on 5/10/23.
//

import SwiftUI

@main
struct WhatWouldMyCrewDoApp: App {
    
    @State static var currentView: ViewType = .MainView
    
    static func changeView(to newView: ViewType) {
        print("Changing view to \(newView)")
        WhatWouldMyCrewDoApp.currentView = newView
    }
    
    var body: some Scene {
        WindowGroup {
            switch WhatWouldMyCrewDoApp.currentView {
                case ViewType.MainView:
                        MainView()

                case ViewType.RateAndReviewView:
                        RateAndReviewView()

                case ViewType.PlanTripView:
                    PlanTripView()
              
                case ViewType.ManageFriendsGroupView:
                    ManageFriendsGroupView()
                    
                case ViewType.ShareItineraryView:
                    ShareItineraryView()

            }
        }
    }
}
