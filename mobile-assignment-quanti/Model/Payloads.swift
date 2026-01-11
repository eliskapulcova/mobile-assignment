//
//  Payloads.swift
//  mobile-assignment-quanti
//
//  Created by Eliska Pulcova on 11.01.2026.
//

import Foundation

struct Payloads: Decodable, Hashable {
    let compositeFairing: CompositeFairing?
    let option1: String?
}

extension Payloads {
    enum CodingKeys: String, CodingKey {
        case compositeFairing = "composite_fairing"
        case option1 = "option_1"
    }
}

struct CompositeFairing: Decodable, Hashable {
    let height: Dimension
    let diameter: Dimension
}
