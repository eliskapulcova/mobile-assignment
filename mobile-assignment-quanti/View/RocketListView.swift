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
                        .foregroundStyle(.primary)
                } else {
                    List(viewModel.rockets) { rocket in
                        NavigationLink(value: rocket) {
                            HStack(spacing: 12) {
                                Image("Rocket")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(rocket.name)
                                        .font(.headline)
                                        .foregroundStyle(.primary)
                                    
                                    Text("First flight: \(rocket.firstFlight)")
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    .background(Color(.systemBackground))
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

#Preview {
    RocketListView()
        .preferredColorScheme(.light)
}

#Preview {
    RocketListView()
        .preferredColorScheme(.dark)
}
