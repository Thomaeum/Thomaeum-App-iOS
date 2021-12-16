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
    var content: Content?
    var link: String
    var excerpt: Excerpt
    var embedded: Embedded
    
    enum CodingKeys: String, CodingKey {
        case id
        case date
        case title
        case content
        case link
        case excerpt
        case embedded = "_embedded"
    }
    
    struct Title: Codable {
        var rendered: String
    }
    
    struct Content: Codable {
        var rendered: String
    }
    
    struct Excerpt: Codable {
        var rendered: String
    }
    
    struct Embedded: Codable {
        var author: [Author]
        var featuredMedia: [FeaturedMedia]
        
        enum CodingKeys: String, CodingKey {
            case author
            case featuredMedia = "wp:featuredmedia"
        }
        
        struct Author: Codable {
            var name: String
        }
        
        struct FeaturedMedia: Codable {
            var source_url: String
        }
    }
}
