//
//  Styles.swift
//  WhatWouldMyCrewDo
//
//  Created by Tom Scoggan on 5/12/23.
//

import SwiftUI

struct Styles {
    static let buttonRadius: CGFloat = 15
}

struct ButtonLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon
            configuration.title
        }
            //.padding()
            .frame(width: 75, height: 75)
            .background(Colors.buttonBackground)
            .cornerRadius(Styles.buttonRadius)
            .foregroundColor(Colors.buttonForeground)
            .overlay(
                RoundedRectangle(cornerRadius: Styles.buttonRadius)
                    .stroke(Colors.buttonBorder, lineWidth: 3)
            )

    }
}

struct Styles_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(CurrentState())
    }
}
