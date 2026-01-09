//
//  Rockets.swift
//  mobile-assignment-quanti
//
//  Created by Eliska Pulcova on 09.01.2026.
//

import Foundation

struct Rocket: Identifiable, Codable, Hashable {
    let id: String
    let name: String
    let description: String
    let firstFlight: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case firstFlight = "first_flight"
    }
}
