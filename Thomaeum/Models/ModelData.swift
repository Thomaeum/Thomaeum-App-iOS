//
//  ModelData.swift
//  Thomaeum
//
//  Created by Simon Sure on 11.11.21.
//

import Foundation
import Combine
import SwiftUI

final class ModelData: ObservableObject {
    
    @Published var articles: [ArticleService]?
    private var articlesLoaded: Int = 0
    
    @Published var loadable: Bool = true
    
    @Published var testomate: Int = 0
    
    func loadFirstPreview() {
        let urlString = "https://thoms-line.thomaeum.de/wp-json/wp/v2/posts?_fields=id,date,title.rendered,excerpt.rendered"
        let url = URL(string: urlString)
        
        guard let url = url else {
            self.loadable = false
            return
        }
        
        print("before")
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            print("task cclosure")
            if let data = data {
                print("data")
                //self.articlesLoaded += 10
                let decoder = JSONDecoder()
                do {
                    print("do")
                    let articles = try decoder.decode([ArticleService].self, from: data)
                    DispatchQueue.main.async {
                        self.articles = articles
                    }
                } catch {
                    print("erro while decoding")
                }
            }
        }
        
        task.resume()
        
        print("after")
        
    }
    
    /*do {
        let decoder = JSONDecoder()
        articlesLoaded += 10
        return try decoder.decode([article].self, from: data)
    } catch {
        fatalError("Couldn't parse json as article structure.")
    }*/
    
    func loadMorePreview() {
        
    }
    
    func loadArticle() {
        
    }
}
