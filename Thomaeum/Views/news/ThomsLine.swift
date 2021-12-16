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
    @State private var showSafari: Bool = false
    
    var body: some View {
        NavigationView {
            if newsData.articles != nil {
                List(newsData.articles!) { article in
                    NavigationLink {
                        ArticleView(article: article)
                            .onAppear {
                                newsData.loadCompleteArticleByID(article.id)
                            }
                    } label: {
                        Card(article: article)
                    }
                }
                .padding(.horizontal, 20)
                .listStyle(.plain)
                .refreshable {
                    newsData.reloadArticles()
                }
                .navigationTitle("ThomsLine")
            } else {
                ProgressView()
                    .navigationTitle("ThomsLine")
            }
        }
    }
}

struct ThomsLine_Previews: PreviewProvider {
    static var previews: some View {
        ThomsLine()
    }
}
