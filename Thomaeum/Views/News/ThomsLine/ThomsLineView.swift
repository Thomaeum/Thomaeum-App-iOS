//
//  ThomsLine.swift
//  Thomaeum
//
//  Created by Simon Sure on 08.11.21.
//

import SwiftUI

struct ThomsLineView: View {
    
    @EnvironmentObject var thomsLineData: ThomsLineData
    
    @State private var showingFilter = false
    @State private var showSafari: Bool = false
    
    var body: some View {
        NavigationView {
            if thomsLineData.articles != nil {
                List {
                    ForEach(thomsLineData.articles!) { article in
                        ZStack {
                            CardView(article: article)
                                .onAppear {
                                    thomsLineData.loadMoreArticlesIfNecessary(article)
                                }
                            NavigationLink {
                                ArticleView(article: article)
                                    .onAppear {
                                        thomsLineData.loadCompleteArticleByID(article.id)
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
                    thomsLineData.initialLoad()
                }
                .listStyle(.plain)
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
        ThomsLineView()
    }
}
