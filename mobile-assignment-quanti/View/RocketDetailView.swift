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
            VStack(alignment: .leading, spacing: 24) {

                // MARK: - Overview
                Text("Overview")
                    .font(.title2)
                    .bold()

                Text(rocket.description)
                    .font(.body)
                    .foregroundColor(.primary)

                // MARK: - Parameters
                Text("Parameters")
                    .font(.title2)
                    .bold()
                    .padding(.top, 8)

                HStack(spacing: 12) {
                    ParameterView(
                        value: "\(rocket.height.meters ?? 0)m",
                        label: "Height"
                    )

                    ParameterView(
                        value: "\(rocket.diameter.meters ?? 0)m",
                        label: "Diameter"
                    )

                    ParameterView(
                        value: "\(rocket.mass.kg/1000)t",
                        label: "Mass"
                    )
                }
                
                StageCardView(
                    stageName: "First Stage",
                    isReusable: rocket.firstStage.reusable,
                    engines: rocket.firstStage.engines,
                    fuelTons: rocket.firstStage.fuelAmountTons,
                    burnTimeSeconds: rocket.firstStage.burnTimeSec ?? 0
                )
                
                StageCardView(
                    stageName: "Second Stage",
                    isReusable: rocket.secondStage.reusable,
                    engines: rocket.secondStage.engines,
                    fuelTons: rocket.secondStage.fuelAmountTons,
                    burnTimeSeconds: rocket.secondStage.burnTimeSec ?? 0
                )
                
                // MARK: - Photos
                Text("Photos")
                    .font(.title2)
                    .bold()
                    .padding(.top, 16)

                ForEach(rocket.flickrImages, id: \.self) { urlString in
                    if let url = URL(string: urlString) {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 200) // placeholder height
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit() // keeps aspect ratio
                                    .frame(maxWidth: .infinity)
                                    .cornerRadius(12)
                            case .failure:
                                Color.gray
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 200)
                                    .overlay(
                                        Image(systemName: "photo")
                                            .foregroundColor(.white)
                                            .font(.largeTitle)
                                    )
                            @unknown default:
                                EmptyView()
                            }
                        }
                    }
                }

            }
            .padding()
        }
        .navigationTitle(rocket.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

