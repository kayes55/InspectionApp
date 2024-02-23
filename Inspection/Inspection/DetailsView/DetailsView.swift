//
//  DetailsView.swift
//  Inspection
//
//  Created by Kayes on 2/24/24.
//

import SwiftUI

struct DetailsView: View {
    @Binding var isPresented: Bool
        
    var body: some View {
        VStack {
            HStack {
                Button {
                    isPresented = false
                } label: {
                    Image(systemName: "chevron.left")
                }
                .accentColor(.black)
                
                Spacer()

                Text("GuestRoom 101")
                    .font(.headline)
                Spacer()
                Button {
                } label: {
                    Image(systemName: "info.circle")
                }
                .accentColor(.black)
            }
            .padding()
            
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Holiday Inn Express Franklin")
                            .font(.subheadline)
                            .fontWeight(.black)
                        Spacer()
                        Image(systemName: "ellipsis")
                    }
                    Text("In Progress 18/04/23 at 11:17 Am by David M.")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
                .padding()
                VStack(spacing: 0) {
                    AccordionView(title: "Section", opacity: 0.1, content: {
                        AccordionView(title: "BedRoom", opacity: 0.05) {
                            Text("Inception")
                        }
                    })
                }
            }
            
        }
        .navigationBarHidden(true)
        
    }
}

