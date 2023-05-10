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
            RootView().environmentObject(currentState)
        }
    }
    
}
