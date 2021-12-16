//
//  article.swift
//  Thomaeum
//
//  Created by Simon Sure on 11.11.21.
//

import Foundation
import SwiftUI
import SwiftSoup

struct Article: Identifiable {
    var id: Int
    var date: String
    var title: String
    var excerpt: String
    var content: [Element]?
    var contentUrl: URL
    var author: String
    var imageUrl: String
    
    var someError: Bool = false
    
    init(from service: ArticleService) {
        self.id = service.id
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "de_DE")
        let date = dateFormatter.date(from: service.date)
        if let date = date {
            self.date = dateFormatter.string(from: date)
        } else {
            self.date = ""
            self.someError = true
        }
        
        do {
            self.title = try SwiftSoup.parse(service.title.rendered).text()
        } catch {
            self.title = ""
            self.someError = true
        }
        
        do {
            self.excerpt = try SwiftSoup.parse(service.excerpt.rendered).text()
        } catch {
            self.excerpt = ""
            self.someError = true
        }
        
        self.author = service.embedded.author[0].name
        
        self.imageUrl = service.embedded.featuredMedia[0].source_url
        
        self.contentUrl = URL(string: service.link)!
    }
    
    mutating func setContentFromHTML(_ html: String) {
        do {
            let elementsArray: [Element]? = try SwiftSoup.parseBodyFragment(html).body()?.children().array()
            self.content = elementsArray!
        } catch {}
    }
    
}
