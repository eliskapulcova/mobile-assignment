//
//  RocketListViewModel.swift
//  mobile-assignment-quanti
//
//  Created by Eliska Pulcova on 09.01.2026.
//

import Foundation

@MainActor
final class RocketListViewModel: ObservableObject {

    @Published var rockets: [Rocket] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service = RocketService()

    func loadRockets() async {
        isLoading = true
        errorMessage = nil

        do {
            rockets = try await service.fetchRockets()
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
