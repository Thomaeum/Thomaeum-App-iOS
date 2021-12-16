//
//  ArticleView.swift
//  Thomaeum
//
//  Created by Simon Sure on 12.12.21.
//

import SwiftUI
import WebKit
import SwiftSoup

struct ArticleView: View {
    var article: Article
    
    var body: some View {
        if let content = article.content {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(article.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    HStack {
                        Text("\(article.author),")
                        Text(article.date)
                    }
                        .font(.caption)
                    Divider()
                    VStack(alignment: .leading) {
                        ForEach(content, id: \.self) { element in
                            viewFromElement(element)
                        }
                    }
                }
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .navigationBarTitleDisplayMode(.inline)
            }
        } else {
            ProgressView()
        }
    }
    
    func viewFromElement(_ element: Element) -> some View {
        if element.tagName() == "p" {
            do {
                return Text(try element.text())
            } catch {}
        }
        return Text("")
    }
}

/*struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
    }
}*/
