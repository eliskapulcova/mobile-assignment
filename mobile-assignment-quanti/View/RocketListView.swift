//
//  RocketListView.swift
//  mobile-assignment-quanti
//
//  Created by Eliska Pulcova on 09.01.2026.
//

import Foundation
import SwiftUI

struct RocketListView: View {

    @StateObject private var viewModel = RocketListViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.errorMessage {
                    Text(error)
                } else {
                    List(viewModel.rockets) { rocket in
                        NavigationLink(value: rocket) {
                          VStack(alignment: .leading, spacing: 4) {
                                Text(rocket.name)
                                    .font(.headline)

                                Text("First flight: \(rocket.firstFlight)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Rockets")
            .navigationDestination(for: Rocket.self) { rocket in
                RocketDetailView(rocket: rocket)
            }
            .task {
                await viewModel.loadRockets()
            }
        }
    }
}
