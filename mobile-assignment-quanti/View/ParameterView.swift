//
//  ParameterView.swift
//  mobile-assignment-quanti
//
//  Created by Eliska Pulcova on 12.01.2026.
//

import Foundation
import SwiftUI

struct ParameterView: View {
    let value: String
    let label: String

    var body: some View {
        VStack(spacing: 6) {
            Text(value)
                .font(.headline)
                .bold()

            Text(label)
                .font(.caption)
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.red)
        .cornerRadius(12)
    }
}

