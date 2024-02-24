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
                    
                }
                Spacer()
            }
        }
    }
}
