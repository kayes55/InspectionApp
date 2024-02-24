//
//  CompleteButton.swift
//  Inspection
//
//  Created by Kayes on 2/24/24.
//

import SwiftUI

struct CompleteButton: View {
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                
                Text("Complete")
                    .foregroundColor(.white)
                    .font(.title2)
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color.indigo)
            .cornerRadius(8)
        }
    }
}
