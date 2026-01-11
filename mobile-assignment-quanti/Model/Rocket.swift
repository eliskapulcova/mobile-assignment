//
//  Rockets.swift
//  mobile-assignment-quanti
//
//  Created by Eliska Pulcova on 09.01.2026.
//

import Foundation

struct Rocket: Identifiable, Decodable, Hashable {

    let id: String
    let name: String
    let description: String
    let firstFlight: String

    let height: Dimension
    let diameter: Dimension
    let mass: Mass

    let firstStage: Stage
    let secondStage: Stage

    let engines: Engines
    let landingLegs: LandingLegs
    let payloadWeights: [PayloadWeight]

    let flickrImages: [String]

    let active: Bool
    let stages: Int
    let boosters: Int
    let costPerLaunch: Int
    let successRatePct: Int

    let country: String
    let company: String
    let wikipedia: String
}

struct Dimension: Decodable, Hashable {
    let meters: Double?
    let feet: Double?
}

struct Mass: Decodable, Hashable {
    let kg: Int
    let lb: Int
}

struct Thrust: Decodable, Hashable {
    let kN: Int
    let lbf: Int
}

struct LandingLegs: Decodable, Hashable {
    let number: Int
    let material: String?
}

struct PayloadWeight: Decodable, Hashable, Identifiable {
    let id: String
    let name: String
    let kg: Int
    let lb: Int
}

extension Rocket {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case height
        case diameter
        case mass
        case engines
        case active
        case stages
        case boosters
        case country
        case company
        case wikipedia

        case flickrImages = "flickr_images"
        case firstFlight = "first_flight"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case landingLegs = "landing_legs"
        case payloadWeights = "payload_weights"
        case costPerLaunch = "cost_per_launch"
        case successRatePct = "success_rate_pct"
    }
}



