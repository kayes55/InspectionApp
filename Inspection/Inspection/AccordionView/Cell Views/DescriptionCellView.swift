//
//  DescriptionCellView.swift
//  Inspection
//
//  Created by Kayes on 2/24/24.
//

import SwiftUI

struct DescriptionCellView: View {
    let title: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.caption)
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
            Divider()
            HStack(spacing: 0) {
                Spacer()
                MagicButton(color: .green, imageName: "checkmark") {
                    // make action
                }

                MagicButton(color: .gray, imageName: "exclamationmark.octagon") {
                    
                }
                MagicButton(color: .brown, imageName: "minus") {
                    
                }
                MagicButton(color: .red, imageName: "multiply") {
                    
                }
            }
            Divider()
        }
    }
}

//#Preview {
//    DescriptionCellView()
//}
