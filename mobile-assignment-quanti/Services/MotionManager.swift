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
            self.pitch = motion.attitude.pitch
        }
    }

    func stop() {
        motionManager.stopDeviceMotionUpdates()
    }
}

