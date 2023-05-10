//
//  MainView.swift
//  WhatWouldMyCrewDo
//
//  Created by Tom Scoggan on 5/10/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("What Would My Crew Do?").padding()
            
            HStack {
                Button("Rate Something") {
                    WhatWouldMyCrewDoApp.changeView(to: ViewType.RateAndReviewView)
                }
                Button("Plan a Trip") {
                    WhatWouldMyCrewDoApp.changeView(to: ViewType.PlanTripView)
                }
              
            }
            HStack {
                Button("Manage Friends") {
                    WhatWouldMyCrewDoApp.changeView(to: ViewType.ManageFriendsGroupView)
                }
                Button("Share Itinerary") {
                    WhatWouldMyCrewDoApp.changeView(to: ViewType.ShareItineraryView)
                }
            }
        }
        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
