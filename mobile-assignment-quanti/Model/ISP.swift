//
//  ISP.swift
//  mobile-assignment-quanti
//
//  Created by Eliska Pulcova on 11.01.2026.
//

import Foundation

struct ISP: Decodable, Hashable {
    let seaLevel: Int
    let vacuum: Int
}

extension ISP {
    enum CodingKeys: String, CodingKey {
        case seaLevel = "sea_level"
        case vacuum
    }
}
