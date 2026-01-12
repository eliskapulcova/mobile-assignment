//
//  StageCardView.swift
//  mobile-assignment-quanti
//
//  Created by Eliska Pulcova on 12.01.2026.
//

import Foundation
import SwiftUI

struct StageCardView: View {
    let stageName: String
    let isReusable: Bool
    let engines: Int
    let fuelTons: Double
    let burnTimeSeconds: Int
    
    var reusableLabel: String {
        isReusable ? "reusable" : "not reusable"
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(stageName)
                .font(.headline)
                .foregroundColor(.black)

            StageParameterRow(iconName: "Reusable", label: reusableLabel)
            StageParameterRow(iconName: "Engine", label: "\(engines) engines")
            StageParameterRow(iconName: "Fuel", label: "\(fuelTons) tons of fuel")
            StageParameterRow(iconName: "Burn", label: "\(burnTimeSeconds) seconds burn time")
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
}
