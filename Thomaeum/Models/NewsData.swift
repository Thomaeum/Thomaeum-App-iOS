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
    
    //variables
    @Published var articles: [Article]?
    private var articlesLoaded: Int = 0
    
    //constants
    let baseUrl: String = "https://thoms-line.thomaeum.de/wp-json/wp/v2/"
    let basicInformationQueryArguments: String = "_fields=id,date,link,title.rendered,excerpt.rendered,_links.wp:featuredmedia,_links.author&_embed&per_page=10"
    let allInformationQueryArguments: String = "_fields=id,date,link,title.rendered,content.rendered,excerpt.rendered&_embed"
    
    //debug
    @Published var testomate: Int = 0
    
    func updateArticlesOnChange() {
        
    }
    
    func reloadArticles() {
        
    }
    
    func loadTenMoreArticles() {
        let urlString = baseUrl+"posts?"+basicInformationQueryArguments+"&offset="+String(self.articlesLoaded)
        
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let articlesServices = try decoder.decode([ArticleService].self, from: data)
                    let articles = articlesServices.map {
                        Article(from: $0)
                    }
                    DispatchQueue.main.async {
                        self.articlesLoaded += 10
                        self.articles = articles
                    }
                } catch { print("error: \(error)") }
            }
        }
        
        task.resume()
    }
    
    func loadMoreArticlesIfNecessary(_ currentItem: Article?) {
        guard let currentItem = currentItem else {
            loadTenMoreArticles()
            return
        }
        
        let thresholdIndex = self.articles!.index(self.articles!.endIndex, offsetBy: -5)
        if self.articles?.firstIndex(where: { article in
            article.id == currentItem.id
        }) == thresholdIndex {
            loadTenMoreArticles()
        }
    }
    
    func loadCompleteArticleByID(_ id: Int) {
        let urlString = self.baseUrl+"posts/"+String(id)+"?"+self.allInformationQueryArguments
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let index = self.articles?.firstIndex(where: { article in
            article.id == id
        })
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let articleService = try decoder.decode(ArticleService.self, from: data)
                    DispatchQueue.main.async {
                        self.articles![index!].setContentFromHTML(articleService.content!.rendered)
                    }
                } catch { print("error: \(error)") }
            }
        }
        
        task.resume()
    }
}
