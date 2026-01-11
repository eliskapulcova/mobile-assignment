//
//  RocketServiceProtocol.swift
//  mobile-assignment-quanti
//
//  Created by Eliska Pulcova on 11.01.2026.
//

import Foundation

protocol RocketServiceProtocol {
    func fetchRockets() async throws -> [Rocket]
    func fetchRocket(id: String) async throws -> Rocket
}
