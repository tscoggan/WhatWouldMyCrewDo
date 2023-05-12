//
//  MainView.swift
//  WhatWouldMyCrewDo
//
//  Created by Tom Scoggan on 5/10/23.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var currentState: CurrentState
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                
                Colors.appBackground.ignoresSafeArea()
                
                switch currentState.currentView {
                    case .TitleScreenView: TitleScreenView()
                    case .RateAndReviewView: RateAndReviewView()
                    case .PlanTripView: PlanTripView()
                    case .ManageFriendsGroupView: ManageFriendsGroupView()
                    case .ShareItineraryView: ShareItineraryView()
                }
                
            }
            .foregroundColor(Colors.appForeground)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button(action: {
                        currentState.changeView(to: ViewType.RateAndReviewView)
                    }) {
                        RateReviewButtonView()
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        currentState.changeView(to: ViewType.PlanTripView)
                    }) {
                        PlanTripButtonView()
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        currentState.changeView(to: ViewType.ManageFriendsGroupView)
                    }) {
                        ManageFriendsButtonView()
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        currentState.changeView(to: ViewType.ShareItineraryView)
                    }) {
                        ShareItineraryButtonView()
                    }
                }
            }
        }.preferredColorScheme(.dark)
    }
}



struct RateReviewButtonView: View {
    var body: some View {       
        Label("Rate", systemImage: "star.leadinghalf.filled")
            .labelStyle(ButtonLabelStyle())
    }
}

struct PlanTripButtonView: View {
    var body: some View {
        Label("Plan Trip", systemImage: "airplane")
            .labelStyle(ButtonLabelStyle())
    }
}

struct ManageFriendsButtonView: View {
    var body: some View {
        Label("My Crew", systemImage: "person.3.fill")
            .labelStyle(ButtonLabelStyle())
    }
}

struct ShareItineraryButtonView: View {
    var body: some View {
        Label("Share", systemImage: "square.and.arrow.up")
            .labelStyle(ButtonLabelStyle())
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(CurrentState())
    }
}
