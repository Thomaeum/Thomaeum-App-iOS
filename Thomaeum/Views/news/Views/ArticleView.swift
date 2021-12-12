//
//  ArticleView.swift
//  Thomaeum
//
//  Created by Simon Sure on 12.12.21.
//

import SwiftUI

struct ArticleView: View {
    var article: ArticleService
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text("\(article.embedded.author[0].name),")
                    Text(article.date)
                }
                    .font(.caption)
                Divider()
                Text(article.content!.rendered)
            }
            .padding()
        }
        .navigationTitle(article.title.rendered)
    }
}

/*struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
    }
}*/
