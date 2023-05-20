//
//  GlobalVars.swift
//  WhatWouldMyCrewDo
//
//  Created by Tom Scoggan on 5/10/23.
//

import Foundation
import SwiftUI

class CurrentState: ObservableObject {
    
    @Published var currentView: ViewType = .TitleScreenView
    
    func changeView(to newView: ViewType) {
        currentView = newView
    }
    
    var userLocationIsAuthorized: Bool = false
    
}
