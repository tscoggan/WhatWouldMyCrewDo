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
        VStack {
                       
            HStack(alignment: .top, spacing: 10.0) {
               
                Button(action: {
                    currentState.changeView(to: ViewType.RateAndReviewView)
                }) {
                    Text("Rate / Review")
                        .font(.title3)
                        .foregroundColor(.blue)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue, lineWidth: 5)
                        )
                }
                
                Button(action: {
                    currentState.changeView(to: ViewType.PlanTripView)
                }) {
                    Text("Plan a Trip")
                        .font(.title3)
                        .foregroundColor(.blue)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue, lineWidth: 5)
                        )
                }
                
                Button(action: {
                    currentState.changeView(to: ViewType.ManageFriendsGroupView)
                }) {
                    Text("My Friends")
                        .font(.title3)
                        .foregroundColor(.blue)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue, lineWidth: 5)
                        )
                }
                
                Button(action: {
                    currentState.changeView(to: ViewType.ShareItineraryView)
                }) {
                    Text("Share Itinerary")
                        .font(.title3)
                        .foregroundColor(.blue)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue, lineWidth: 5)
                        )
                }
            }.padding()
            
            switch currentState.currentView {
                case .TitleScreenView: TitleScreenView()
                case .RateAndReviewView: RateAndReviewView()
                case .PlanTripView: PlanTripView()
                case .ManageFriendsGroupView: ManageFriendsGroupView()
                case .ShareItineraryView: ShareItineraryView()
            }
        }
        .padding()
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(CurrentState())
    }
}
