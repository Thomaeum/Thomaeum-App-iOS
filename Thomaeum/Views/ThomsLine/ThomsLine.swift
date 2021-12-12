//
//  ThomsLine.swift
//  Thomaeum
//
//  Created by Simon Sure on 08.11.21.
//

import SwiftUI

struct ThomsLine: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var showingFilter = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                if modelData.articles != nil {
                    VStack(spacing: 20) {
                        ForEach(modelData.articles!) { article in
                            Card(article: article)
                        }
                    }
                    .frame(
                        maxWidth: .infinity
                    )
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                } else {
                    Text("No articles available yet.")
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
