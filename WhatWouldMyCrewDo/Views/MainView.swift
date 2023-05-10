//
//  MainView.swift
//  WhatWouldMyCrewDo
//
//  Created by Tom Scoggan on 5/10/23.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var currentState: CurrentState
    
    var body: some View {
        VStack {
                       
            HStack {
                Button("Rate Something") {
                    currentState.changeView(to: ViewType.RateAndReviewView)
                }
                Button("Plan a Trip") {
                    currentState.changeView(to: ViewType.PlanTripView)
                }
              
            }
            HStack {
                Button("Manage Friends") {
                    currentState.changeView(to: ViewType.ManageFriendsGroupView)
                }
                Button("Share Itinerary") {
                    currentState.changeView(to: ViewType.ShareItineraryView)
                }
            }
        }
        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(CurrentState())
    }
}
