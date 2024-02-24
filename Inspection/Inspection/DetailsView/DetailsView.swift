//
//  DetailsView.swift
//  Inspection
//
//  Created by Kayes on 2/24/24.
//

import SwiftUI

struct DetailsView: View {
    @Binding var isPresented: Bool
    @State private var offsetX: CGFloat = 0
    @State private var isDragging = false
    
    @State private var cells1 = Array(1...3)
    @State private var cells2 = Array(1...3)
    @State private var activeCell1: Int?
    @State private var activeCell2: Int?
    @State private var cellOffsets1: [CGFloat] = Array(repeating: 0, count: 3)
    @State private var cellOffsets2: [CGFloat] = Array(repeating: 0, count: 3)
    
    @State private var isShowingOverlay = false
        
    var body: some View {
        ZStack {
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
                    VStack(spacing: 5) {
                        AccordionView(title: "Cleanliness Inspection", opacity: 0.1, content: {
                            AccordionView(title: "Bedrooms", opacity: 0.05) {
                                ScrollView(showsIndicators: false) {
                                    VStack(spacing: 0) {
                                        ForEach(cells1, id: \.self) { index in
                                            DescriptionCellView(title: "Every inch of the room has been sanitized", index: index, isActive: self.bindingForIndex(index, activeCell: $activeCell1))
                                                .offset(x: self.cellOffsets1[index - 1])
                                                .gesture(
                                                    DragGesture()
                                                        .onChanged { value in
                                                            self.activeCell1 = index
                                                            self.cellOffsets1[index - 1] = value.translation.width
                                                        }
                                                        .onEnded { value in
                                                            withAnimation {
                                                                if value.translation.width < -300 {
                                                                    // Swipe beyond threshold, show delete button
                                                                    self.cellOffsets1[index - 1] = -300
                                                                } else {
                                                                    // Reset to original position
                                                                    self.cellOffsets1[index - 1] = 0
                                                                }
                                                            }
                                                            
                                                        }
                                                )
                                                .onTapGesture {
                                                    withAnimation {
                                                        // Toggle the visibility of the overlay view
                                                        isShowingOverlay.toggle()
                                                    }
                                                }
                                        }
                                    }
                                    
                                }
                            }
                        })
                        
                        AccordionView(title: "AM Inspection", opacity: 0.1, content: {
                            AccordionView(title: "Living areas", opacity: 0.05) {
                                ScrollView(showsIndicators: false) {
                                    VStack(spacing: 0) {
                                        ForEach(cells2, id: \.self) { index in
                                            DescriptionCellView(title: "Every inch of the room has been sanitized", index: index, isActive: self.bindingForIndex(index, activeCell: $activeCell2))
                                                .offset(x: self.cellOffsets2[index - 1])
                                                .gesture(
                                                    DragGesture()
                                                        .onChanged { value in
                                                            self.activeCell2 = index
                                                            self.cellOffsets2[index - 1] = value.translation.width
                                                        }
                                                        .onEnded { value in
                                                            withAnimation {
                                                                if value.translation.width < -300 {
                                                                    // Swipe beyond threshold, show delete button
                                                                    self.cellOffsets2[index - 1] = -300
                                                                } else {
                                                                    // Reset to original position
                                                                    self.cellOffsets2[index - 1] = 0
                                                                }
                                                            }
                                                            
                                                        }
                                                )
                                        }
                                    }
                                    
                                }
                            }
                        })
                    }
                    
                    CompleteButton() {
                        // make some action here
                    }
                    .padding(.vertical)
                }
                
            }
            if isShowingOverlay {
                GalleryView(isShowingOverlay: $isShowingOverlay)
                    .transition(.opacity) // Apply fade animation
            }
        }
        .navigationBarHidden(true)
        
    }
    
    private func bindingForIndex(_ index: Int, activeCell: Binding<Int?>) -> Binding<Bool> {
        return Binding<Bool>(
            get: {
                return activeCell.wrappedValue == index
            },
            set: { newValue in
                if newValue {
                    activeCell.wrappedValue = index
                } else {
                    activeCell.wrappedValue = nil
                }
            }
        )
    }
}

