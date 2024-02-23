//
//  MagicButton.swift
//  Inspection
//
//  Created by Kayes on 2/24/24.
//

import SwiftUI

struct MagicButton: View {
    let color: Color
    let imageName: String
    var action: () -> Void // Action to perform when the button is tapped
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Rectangle()
                    .fill(color)
                    .frame(width: 40, height: 40)
                Image(systemName: imageName)
                    .foregroundColor(.white)
            }
        }
    }
}
