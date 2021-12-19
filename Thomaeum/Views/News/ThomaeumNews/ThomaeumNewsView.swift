//
//  News.swift
//  Thomaeum
//
//  Created by Simon Sure on 17.12.21.
//

import SwiftUI

struct ThomaeumNewsView: View {
    @EnvironmentObject var thomaeumData: ThomaeumNewsData
    
    @State private var showingFilter = false
    @State private var showSafari: Bool = false
    
    var body: some View {
        NavigationView {
            if thomaeumData.articles != nil {
                List {
                    ForEach(thomaeumData.articles!) { article in
                        ZStack {
                            CardView(article: article)
                                .onAppear {
                                    thomaeumData.loadMoreArticlesIfNecessary(article)
                                }
                            NavigationLink {
                                ArticleView(article: article)
                                    .onAppear {
                                        thomaeumData.loadCompleteArticleByID(article.id)
                                    }
                            } label: {
                                EmptyView()
                            }
                            .opacity(0.0)
                        }
                        .listRowInsets(EdgeInsets())
                    }
                    .padding(.horizontal, 20)
                }
                .refreshable {
                    thomaeumData.initialLoad()
                }
                .listStyle(.plain)
                .navigationTitle("Aktuelles")
            } else {
                ProgressView()
                    .navigationTitle("Aktuelles")
            }
        }
    }
}

struct News_Previews: PreviewProvider {
    static var previews: some View {
        ThomaeumNewsView()
    }
}
