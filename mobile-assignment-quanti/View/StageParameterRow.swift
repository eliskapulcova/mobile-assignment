//
//  StageParameterRow.swift
//  mobile-assignment-quanti
//
//  Created by Eliska Pulcova on 12.01.2026.
//

import Foundation
import SwiftUI

struct StageParameterRow: View {
    let iconName: String
    let label: String
    //let value: String

    var body: some View {
        HStack(spacing: 8) {
            Image(iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundStyle(.primary)

            Text(label)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)

            Spacer()
        }
    }
}

