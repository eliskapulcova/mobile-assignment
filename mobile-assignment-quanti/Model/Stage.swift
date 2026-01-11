//
//  Stage.swift
//  mobile-assignment-quanti
//
//  Created by Eliska Pulcova on 11.01.2026.
//

import Foundation

struct Stage: Decodable, Hashable {

    let reusable: Bool
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSec: Int?

    let thrustSeaLevel: Thrust?
    let thrustVacuum: Thrust?
    let thrust: Thrust?

    let payloads: Payloads?
}

extension Stage {
    enum CodingKeys: String, CodingKey {
        case reusable
        case engines
        case payloads
        case thrust
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSec = "burn_time_sec"
    }
}
