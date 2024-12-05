//
//  SettingsView.swift
//  Hike
//
//  Created by Pham Trung Hieu on 04/12/2024.
//

import SwiftUI

struct SettingsView: View {
    private let alternativeAppIcons: [String] = [
    "AppIcon-MagnifyingGlass",
    "AppIcon-Backpack",
    "AppIcon-Camera",
    "AppIcon-Campfire",
    "AppIcon-Map",
    "AppIcon-Mushroom",
    ]
    var body: some View {
        List {
            // MARK: -Section: Header
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading").font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("Hike").font(.system(size: 66, weight: .black))
                        Text("Editor's choice").fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing").font(.system(size: 80, weight: .black))
                    Spacer()
                }.foregroundStyle(LinearGradient(colors: [.greenLight,
                                                          .greenMedium,
                                                          .greenDark], startPoint: .top, endPoint: .leading))
                .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    Text("The hike which looks gorgeous in photos but is even better once you actually here. The hike that you hope to do again someday. \nFind the best day hikes in the app")
                        .font(.footnote)
                        .italic()
                    Text("Dust off the boots! It's time for a walk")
                        .fontWeight(.heavy)
                        .foregroundStyle(Color.greenMedium)
                }.multilineTextAlignment(.center)
                 .padding(.bottom, 30)
                 .frame(maxWidth: .infinity)
                
            }.listRowSeparator(.hidden)
            
            // MARK: -Section: Icons
            Section(header: Text("Alternative Icon")) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternativeAppIcons, id: \.self) { item in
                            Button {
                                UIApplication.shared.setAlternateIconName(item) { error in
                                    if error != nil {
                                        print("Failed to change app's icon to: \(String(describing: error?.localizedDescription)) ")
                                    }else {
                                        print("Success! You have changed the app's icon to \(item)")
                                    }
                                }
                            } label: {
                                Image("\(item)-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }.buttonStyle(.borderless)
                        }
                    }
                }.padding(.top, 12)
                
                Text("Choose your favorite app icon from the collection above.")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            }.listRowSeparator(.hidden)
            
            // MARK: -Section: About
            
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack {
                    Spacer()
                    Text("Copy right All right reserved")
                    Spacer()
                }.padding(8)
            ) {
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: Color.blue)
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "infor.circle", rowContent: "iOS", rowTintColor: .red)
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Palm Cental Hieu", rowTintColor: .pink)
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowContent: "", rowTintColor: .indigo, rowLinkLabel: "PalmCentralHieu.com", rowLinkDestinaton: "https://google.com")
                  
            }
        }
        
    }
}

#Preview {
    SettingsView()
}
