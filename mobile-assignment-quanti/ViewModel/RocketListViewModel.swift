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

    private let service: RocketServiceProtocol

    init(service: RocketServiceProtocol = RocketService()) {
        self.service = service
    }

    func loadRockets() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        do {
            rockets = try await service.fetchRockets()
        } catch let error as RocketServiceError {
            switch error {
            case .notFound:
                errorMessage = "Rocket not found."
            case .serverError:
                errorMessage = "Server error. Please try again later."
            case .invalidResponse:
                errorMessage = "Invalid server response."
            case .decodingFailed:
                errorMessage = "Failed to process data."
            }
        } catch {
            errorMessage = "Unexpected error."
        }
    }
}

