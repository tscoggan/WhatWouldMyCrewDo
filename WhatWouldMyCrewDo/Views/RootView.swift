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
                        VStack {
                            Image(systemName: "star.leadinghalf.filled")
                            Text("Rate")
                        }
                    }.buttonStyle(MainButtonStyle())
                    .addSelectedBadge(currentState.currentView == ViewType.RateAndReviewView)
                    
                    Spacer()
                    
                    Button(action: {
                        currentState.changeView(to: ViewType.PlanTripView)
                    }) {
                        VStack {
                            Image(systemName: "airplane")
                            Text("Plan Trip")
                        }
                    }.buttonStyle(MainButtonStyle())
                    .addSelectedBadge(currentState.currentView == ViewType.PlanTripView)
                    
                    Spacer()
                    
                    Button(action: {
                        currentState.changeView(to: ViewType.ManageFriendsGroupView)
                    }) {
                        VStack {
                            Image(systemName: "person.3.fill")
                            Text("My Crew")
                        }
                    }.buttonStyle(MainButtonStyle())
                    .addSelectedBadge(currentState.currentView == ViewType.ManageFriendsGroupView)
                    
                    Spacer()
                    
                    Button(action: {
                        currentState.changeView(to: ViewType.ShareItineraryView)
                    }) {
                        VStack {
                            Image(systemName: "square.and.arrow.up")
                            Text("Share")
                        }
                    }.buttonStyle(MainButtonStyle())
                    .addSelectedBadge(currentState.currentView == ViewType.ShareItineraryView)
                }
            }
        }.preferredColorScheme(.dark)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(CurrentState())
    }
}
