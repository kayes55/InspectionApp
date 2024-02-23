//
//  HomeCellView.swift
//  Inspection
//
//  Created by Kayes on 2/24/24.
//

import SwiftUI

struct HomeCellView: View {
    var title: String
    var subtitle: String
    var date: String
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .lineLimit(2)
                Text(subtitle)
                    .font(.caption2)
                    .foregroundColor(.gray)
                    
            }
            Spacer()
            VStack {
                Text(date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            
                
        }
        .padding()
        .background(Color.gray.opacity(0.05))
        .cornerRadius(8.0)
    }
}
