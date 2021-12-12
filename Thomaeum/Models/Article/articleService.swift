//
//  articleService.swift
//  Thomaeum
//
//  Created by Simon Sure on 11.12.21.
//

import Foundation

struct ArticleService: Codable, Identifiable {
    var id: Int
    var date: String
    var title: Title
    var excerpt: Excerpt
    
    struct Title: Codable {
        var rendered: String
    }
    
    struct Excerpt: Codable {
        var rendered: String
    }
}
