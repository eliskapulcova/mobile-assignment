//
//  RocketService.swift
//  mobile-assignment-quanti
//
//  Created by Eliska Pulcova on 09.01.2026.
//

import Foundation

final class RocketService: RocketServiceProtocol {
    private let baseURL = "https://api.spacexdata.com/v4/rockets"

    func fetchRockets() async throws -> [Rocket] {
        let url = URL(string: baseURL)!
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw RocketServiceError.serverError
        }

        do {
            return try JSONDecoder().decode([Rocket].self, from: data)
        } catch {
            throw RocketServiceError.decodingFailed
        }
    }
    
    func fetchRocket(id: String) async throws -> Rocket {
        let url = URL(string: "\(baseURL)/\(id)")!
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw RocketServiceError.invalidResponse
        }

        switch httpResponse.statusCode {
        case 200:
            do {
                return try JSONDecoder().decode(Rocket.self, from: data)
            } catch {
                throw RocketServiceError.decodingFailed
            }

        case 404:
            throw RocketServiceError.notFound

        case 500...599:
            throw RocketServiceError.serverError

        default:
            throw RocketServiceError.invalidResponse
        }
    }

    
    
}
