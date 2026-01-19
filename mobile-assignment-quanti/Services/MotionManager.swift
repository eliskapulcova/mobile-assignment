//
//  MotionManager.swift
//  mobile-assignment-quanti
//
//  Created by Eliska Pulcova on 15.01.2026.
//

import Foundation
import CoreMotion

final class MotionManager: ObservableObject {
    private let motionManager = CMMotionManager()

    @Published var pitch: Double = 0

    func start() {
        guard motionManager.isDeviceMotionAvailable else { return }

        motionManager.deviceMotionUpdateInterval = 1 / 60

        motionManager.startDeviceMotionUpdates(to: .main) { motion, _ in
            guard let motion else { return }
            
            let alpha = 0.1
            let newPitch = motion.attitude.pitch
            self.pitch = alpha * newPitch + (1 - alpha) * self.pitch
            
            self.pitch = max(min(motion.attitude.pitch, 0.5), -0.5)
        }
    }

    func stop() {
        motionManager.stopDeviceMotionUpdates()
    }
}

