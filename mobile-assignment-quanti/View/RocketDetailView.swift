//
//  RocketDetailView.swift
//  mobile-assignment-quanti
//
//  Created by Eliska Pulcova on 09.01.2026.
//

import Foundation
import SwiftUI

struct RocketDetailView: View {

    let rocket: Rocket

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(rocket.name)
                    .font(.largeTitle)
                    .bold()

                Text("First flight: \(rocket.firstFlight)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text(rocket.description)
            }
            .padding()
        }
        .navigationTitle(rocket.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
