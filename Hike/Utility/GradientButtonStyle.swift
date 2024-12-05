//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Pham Trung Hieu on 03/12/2024.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                configuration.isPressed
                ? LinearGradient(colors: [Color.grayMedium, Color.grayLight],
                                        startPoint: .top,
                                        endPoint: .bottom)
                : LinearGradient(colors: [Color.grayLight, Color.grayMedium],
                                        startPoint: .top,
                                        endPoint: .bottom))
            .cornerRadius(40)
    }
}
