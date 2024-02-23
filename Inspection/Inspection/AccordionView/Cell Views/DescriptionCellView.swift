//
//  DescriptionCellView.swift
//  Inspection
//
//  Created by Kayes on 2/24/24.
//

import SwiftUI

struct DescriptionCellView: View {
    let title: String
    let index: Int
    @Binding var isActive: Bool
    @State var cellColor = Color.clear
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(title)
                        .font(.caption)
                        .padding(.top)
                    HStack(alignment: .firstTextBaseline) {
                        Group {
                            Image(systemName: "star")
                            Text("3")
                            Image(systemName: "paperclip")
                            Text("0")
                            Image(systemName: "ellipsis.bubble")
                            Text("0")
                        }
                        .font(.system(size: 11, weight: .light))
                    }
                    .padding(.bottom)
                    Divider()
                }
                Spacer()
                Rectangle()
                    .fill(cellColor)
                    .frame(width: 5)
            }
            if isActive {
                HStack(spacing: 0) {
                    Spacer()
                    MagicButton(color: .green, imageName: "checkmark") {
                        // make action
                        withAnimation {
                            isActive = false
                            cellColor = .green
                        }
                    }

                    MagicButton(color: .gray, imageName: "exclamationmark.octagon") {
                        withAnimation {
                            isActive = false
                            cellColor = .gray
                        }
                    }
                    MagicButton(color: .brown, imageName: "minus") {
                        withAnimation {
                            isActive = false
                            cellColor = .brown
                        }
                    }
                    MagicButton(color: .red, imageName: "multiply") {
                        withAnimation {
                            isActive = false
                            cellColor = .red
                        }
                    }
                }
                Divider()
            }
        }
        .padding(.horizontal)
    }
}

//#Preview {
//    DescriptionCellView()
//}
