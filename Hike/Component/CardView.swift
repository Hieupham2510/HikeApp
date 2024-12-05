//
//  CardView.swift
//  Hike
//
//  Created by Pham Trung Hieu on 30/11/2024.
//

import SwiftUI

struct CardView: View {
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        }while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                // MARK: Header
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .font(.system(size: 52))
                            .fontWeight(.black)
                            .foregroundStyle(LinearGradient(
                                colors: [Color.grayLight, Color.grayMedium],
                                startPoint: .top,
                                endPoint: .bottom))
                            .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                        
                        Spacer()
                        
                        Button {
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }.sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.large, .medium])
                        }
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and families")
                        .italic()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.grayMedium)
                }.padding(.horizontal, 30)
                
                // MARK: Main Body
                ZStack {
                    CustomCircleView()
                    Image("image-\(randomNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeIn(duration: 0.5), value: imageNumber)
                    
                }
                
                // MARK: Footer
                Button {
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(LinearGradient(
                            colors: [Color.greenLight, Color.greenMedium],
                            startPoint: .top,
                            endPoint: .bottom))
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }.buttonStyle(GradientButton())
            }
        }.frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
