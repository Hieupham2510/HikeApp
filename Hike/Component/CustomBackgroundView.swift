//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by Pham Trung Hieu on 30/11/2024.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            // MARK: -3: DEPTH
            Color.greenDark.cornerRadius(40).offset(y: 12)
            
            // MARK: -2: LIGHT
            Color.greenLight.cornerRadius(40).offset(y: 3).opacity(0.85)
            
            // MARK: -1: SURFACE
            LinearGradient(colors: [Color.greenLight, Color.greenMedium],
                           startPoint: .top,
                           endPoint: .bottom)
            .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView().padding()
}
