//
//  GlobalVars.swift
//  WhatWouldMyCrewDo
//
//  Created by Tom Scoggan on 5/10/23.
//

import Foundation
import SwiftUI

class CurrentState: ObservableObject {
    
    @Published var currentView: ViewType = .MainView
    
    func changeView(to newView: ViewType) {
        print("Changing view from \(currentView) to \(newView)")
        currentView = newView
    }
    
}
