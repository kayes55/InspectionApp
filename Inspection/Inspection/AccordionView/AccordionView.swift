//
//  AccordionView.swift
//  Inspection
//
//  Created by Kayes on 2/24/24.
//

import SwiftUI

struct AccordionView<Content: View>: View {
    let title: String
    let opacity: Double
    let content: () -> Content
    @State private var isExpanded = false

    var body: some View {
        VStack(spacing: 0) {
            VStack {
                Button(action: {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }) {
                    HStack {
                        Text(title)
                            .font(.headline)
                        Spacer()
                        Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    }
                }
                .accentColor(.black)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.gray.opacity(opacity))
            if isExpanded {
                content()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
