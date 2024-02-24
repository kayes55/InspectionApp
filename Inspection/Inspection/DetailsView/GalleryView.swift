//
//  GalleryView.swift
//  Inspection
//
//  Created by Kayes on 2/24/24.
//

import SwiftUI

struct GalleryView: View {
    @Binding var isShowingOverlay: Bool
    
    var body: some View {
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                HStack {
                    Spacer()
                    Button {
                        withAnimation {
                            isShowingOverlay.toggle()
                        }
                    } label: {
                        Image(systemName: "multiply.circle")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .accentColor(.white)
                    .padding()
                    
                }
                .padding(.bottom)
                GeometryReader { geo in
                    let size = geo.size
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 5) {
                            ForEach(locations) { location in
                                GeometryReader { proxy in
                                    let cardSize = proxy.size
                                    
                                    let minX = min((proxy.frame(in: .scrollView).minX - 30) * 1.4, size.width * 1.4)
                                    
                                    Image(location.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .offset(x: -minX)
                                        .frame(width: cardSize.width, height: cardSize.height)
                                        .overlay(LocationOverlay(location))
                                        .clipShape(.rect(cornerRadius: 15))
                                        .shadow(color: .black.opacity(0.25), radius: 8, x: 5, y: 10)
                                }
                                .frame(width: size.width - 60, height: size.height - 50)
                                .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                    view
                                        .scaleEffect(phase.isIdentity ? 1 : 0.95)
                                }
                            }
                        }
                        .padding(.horizontal, 30)
                        .scrollTargetLayout()
                        .frame(height: size.height, alignment: .top)
                    }
                    
                    .scrollTargetBehavior(.viewAligned)
                    .scrollIndicators(.hidden)
                    
                }
                .frame(height: 500)
                .padding(.horizontal, -15)
                .padding(.top, 20)
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    func LocationOverlay(_ location: Location) -> some View {
        ZStack(alignment: .bottomLeading) {
            LinearGradient(colors: [.clear, .clear, .clear, .clear, .clear, .black.opacity(0.1), .black.opacity(0.5), .black
            ], startPoint: .top, endPoint: .bottom)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(location.city)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.white)
                
                Text(location.country)
                    .font(.callout)
                    .foregroundStyle(.white.opacity(0.8))
            }
            .padding(20)
        }
    }
}
