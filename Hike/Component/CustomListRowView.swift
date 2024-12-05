//
//  CustomListRowView.swift
//  Hike
//
//  Created by Pham Trung Hieu on 04/12/2024.
//

import SwiftUI

struct CustomListRowView: View {
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = ""
    @State var rowLinkDestinaton: String? =  ""
    
    var body: some View {
        LabeledContent {
            if (!rowContent.isEmpty) {
                Text(rowContent)
                    .foregroundStyle(.primary)
                .fontWeight(.heavy)
            } else if(rowLinkLabel?.isEmpty == false && rowLinkDestinaton?.isEmpty == false) {
                Link(destination: URL(string: rowLinkDestinaton ?? "")!, label: {
                    Text(rowLinkLabel ?? "").foregroundStyle(.blue).fontWeight(.heavy)
                })
            }else {
                EmptyView()
            }
        } label : {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(rowLabel: "",
                          rowIcon: "",
                          rowContent: "",
                          rowTintColor: Color.white)
    }
}
