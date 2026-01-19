//
//  RocketFlameView.swift
//  mobile-assignment-quanti
//
//  Created by Eliska Pulcova on 15.01.2026.
//

import Foundation
import SwiftUI

struct RocketFlameView: View {
    let isActive: Bool

    var body: some View {
        Image(isActive ? "Rocket Flying" : "Rocket Idle")
            .resizable()
            .scaledToFit()
            .frame(width: 40)
            .transition(.opacity)
            .animation(.easeInOut(duration: 0.2), value: isActive)
            .navigationTitle("Launch")
    }
}
