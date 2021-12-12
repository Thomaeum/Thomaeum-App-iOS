//
//  ThomsLine.swift
//  Thomaeum
//
//  Created by Simon Sure on 08.11.21.
//

import SwiftUI

struct ThomsLine: View {
    @EnvironmentObject var newsData: NewsData
    
    @State private var showingFilter = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                if newsData.articles != nil {
                    LazyVStack(spacing: 50) {
                        ForEach(newsData.articles!) { article in
                            NavigationLink(
                                destination: {
                                    ArticleView(article: article)
                                }, label: {
                                    Card(article: article)
                                }
                            )
                        }
                    }
                    .frame(
                        maxWidth: .infinity
                    )
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                } else {
                    Text("No articles available yet.")
                }
            }
            .navigationTitle("ThomsLine")
            /*.toolbar {
                Button {
                    showingFilter.toggle()
                } label: {
                    Label("Filter", systemImage: "line.3.horizontal.decrease.circle")
                }
            }
            .sheet(isPresented: $showingFilter) {
                Text("show filter settingsfor articles")
            }*/

        }
    }
}

struct ThomsLine_Previews: PreviewProvider {
    static var previews: some View {
        ThomsLine()
    }
}
