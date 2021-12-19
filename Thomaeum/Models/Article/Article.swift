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
    var date: Date
    var title: String
    var excerpt: String
    var content: [Element]?
    var contentUrl: URL
    var author: String
    var imageUrl: String
    
    var someError: Bool = false
    let outlet: String
    
    init(from service: ArticleService, outlet: String) {
        self.outlet = outlet
        
        self.id = service.id
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.locale = Locale(identifier: "de_DE")
        self.date = formatter.date(from: service.date)!
        
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
    
    func dateToString() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "de_DE")
        formatter.dateStyle = .long
        return formatter.string(from: self.date)
    }
    
}
