//
//  RocketServiceError.swift
//  mobile-assignment-quanti
//
//  Created by Eliska Pulcova on 11.01.2026.
//

import Foundation

enum RocketServiceError: Error {
    case notFound
    case serverError
    case invalidResponse
    case decodingFailed
}
