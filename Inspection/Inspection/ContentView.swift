//
//  ContentView.swift
//  Inspection
//
//  Created by Kayes on 2/24/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isModalPresented = false
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(showsIndicators: false) {
                    ForEach (0..<InspectionDataFactory.shared.inspecedData().count, id:\.self) { item in
                        HomeCellView(title: InspectionDataFactory.shared.inspecedData()[item].title, subtitle: InspectionDataFactory.shared.inspecedData()[item].subtitle, date: InspectionDataFactory.shared.inspecedData()[item].date)
                            .onTapGesture {
                                isModalPresented = true
                            }
                    }
                    
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                        Text("Inspections")
                        .font(.system(size: 19, weight: .bold))
                        .foregroundColor(.white)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                }
            }
            .toolbarBackground(Color.green, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .sheet(isPresented: $isModalPresented) {
                NavigationView {
                    DetailsView(isPresented: $isModalPresented)
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
