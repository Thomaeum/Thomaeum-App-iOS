//
//  ThomsLine.swift
//  Thomaeum
//
//  Created by Simon Sure on 08.11.21.
//

import SwiftUI

struct ThomsLine: View {
    @State private var showingFilter = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    Text("Here, article boxes are to be displayed")
                }
            }
            .navigationTitle("ThomsLine")
            .toolbar {
                Button {
                    showingFilter.toggle()
                } label: {
                    Label("Filter", systemImage: "line.3.horizontal.decrease.circle")
                }
            }
            .sheet(isPresented: $showingFilter) {
                Text("show filter settingsfor articles")
            }

        }
    }
}

struct ThomsLine_Previews: PreviewProvider {
    static var previews: some View {
        ThomsLine()
    }
}
