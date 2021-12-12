//
//  ModelData.swift
//  Thomaeum
//
//  Created by Simon Sure on 11.11.21.
//

import Foundation
import Combine
import SwiftUI

final class NewsData: ObservableObject {
    
    @Published var articles: [ArticleService]?
    private var articlesLoaded: Int = 0
    
    @Published var loadable: Bool = true
    
    @Published var testomate: Int = 0
    
    func loadFirstPreview() {
        let urlString = "https://thoms-line.thomaeum.de/wp-json/wp/v2/posts?_fields=id,date,title.rendered,excerpt.rendered,content.rendered,_links.wp:featuredmedia,_links.author&_embed"
        let url = URL(string: urlString)
        
        guard let url = url else {
            self.loadable = false
            return
        }
        
        print("before")
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            print("task cclsure")
            if let data = data {
                print("data")
                let decoder = JSONDecoder()
                do {
                    print("do")
                    let articles = try decoder.decode([ArticleService].self, from: data)
                    DispatchQueue.main.async {
                        self.articles = articles
                    }
                } catch {
                    print("error: \(error)")
                }
            }
        }
        
        task.resume()
        
        print("after")
        
    }
    
    func loadMorePreview() {
        
    }
    
    func loadArticle() {
        
    }
}
