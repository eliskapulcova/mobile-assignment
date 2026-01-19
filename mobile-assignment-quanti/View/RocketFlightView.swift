//
//  RocketFlightView.swift
//  mobile-assignment-quanti
//
//  Created by Eliska Pulcova on 15.01.2026.
//

import Foundation
import SwiftUI

struct RocketFlightView: View {

    @StateObject private var motionManager = MotionManager()
    
    private var isGoingUp: Bool {
        motionManager.pitch < 0.05
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.systemBackground).ignoresSafeArea()

                Image(isGoingUp ? "Rocket Idle" : "Rocket Flying")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .offset(y: rocketOffset(screenHeight: geometry.size.height))
                    .animation(.interpolatingSpring(stiffness: 70, damping: 12), value: motionManager.pitch)
            }
            .onAppear {
                motionManager.start()
            }
            .onDisappear {
                motionManager.stop()
            }
        }
        .navigationTitle("Launch")
    }

    private func rocketOffset(screenHeight: CGFloat) -> CGFloat {
        let maxOffset = screenHeight / 3
        let normalized = motionManager.pitch * 400
        return min(max(-normalized, -maxOffset), maxOffset)
    }
}

struct RocketFlightView_Previews: PreviewProvider {
    static var previews: some View {
        RocketFlightView()
            .preferredColorScheme(.dark) // Preview Dark Mode
        RocketFlightView()
            .preferredColorScheme(.light) // Preview Light Mode
    }
}

