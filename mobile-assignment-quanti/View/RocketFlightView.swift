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
        motionManager.pitch < -0.05
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.ignoresSafeArea()

                VStack(spacing: 0) {
                    Image("Rocket Idle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)

                    RocketFlameView(isActive: isGoingUp)
                }
                .offset(y: rocketOffset(screenHeight: geometry.size.height))
                .animation(.easeOut(duration: 0.2), value: motionManager.pitch)
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
        // Convert pitch to vertical movement
        let maxOffset = screenHeight / 3
        let normalized = motionManager.pitch * 200
        return min(max(-normalized, -maxOffset), maxOffset)
    }
}

