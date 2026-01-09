//
//  RocketService.swift
//  mobile-assignment-quanti
//
//  Created by Eliska Pulcova on 09.01.2026.
//

import Foundation

final class RocketService {
    private let baseURL = "https://api.spacexdata.com/v4/rockets"

    func fetchRockets() async throws -> [Rocket] {
        let url = URL(string: baseURL)!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Rocket].self, from: data)
    }
}
