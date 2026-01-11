//
//  Engines.swift
//  mobile-assignment-quanti
//
//  Created by Eliska Pulcova on 11.01.2026.
//

import Foundation

struct Engines: Decodable, Hashable {

    let number: Int
    let type: String
    let version: String
    let layout: String?
    let engineLossMax: Int?

    let propellant1: String
    let propellant2: String

    let thrustSeaLevel: Thrust
    let thrustVacuum: Thrust
    let thrustToWeight: Double

    let isp: ISP
}

extension Engines {
    enum CodingKeys: String, CodingKey {
        case number
        case type
        case version
        case layout
        case isp
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case engineLossMax = "engine_loss_max"
        case propellant1 = "propellant_1"
        case propellant2 = "propellant_2"
        case thrustToWeight = "thrust_to_weight"
    }
}
