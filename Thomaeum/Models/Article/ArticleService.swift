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
    var excerpt: Excerpt
    var embedded: Embedded
    
    enum CodingKeys: String, CodingKey {
        case id
        case date
        case title
        case content
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


/*struct ArticleService: Codable, Identifiable {
    var id: Int
    var date: String
    var title: Title
    var content: Content
    var excerpt: Excerpt
    var _links: Links
    var _embedded: Embedded
    
    struct Title: Codable {
        var rendered: String
    }
    
    struct Excerpt: Codable {
        var rendered: String
    }
    
    struct Content: Codable {
        var rendered: String
    }
    
    struct Links: Codable {
        
        var self: [Link]
        var collection: [Link]
        var about: [Link]
        var author: [Link]
        var replies: [Link]
        var version-history: [Link]
        var predecessor-version: [Link]
        ver wp:featuredmedia: [Link]
        var wp:attachment: [Link]
        var wp:term: [Link]
        var curies: [Link]
        
        struct Link: Codable {
            var href: String
            var embeddable: Bool
            var count: Int
            var id: Int
            var taxonomy: String
            var name: String
            var templated: Bool
        }
        
    }
    
    struct Embedded: Codable {
        
        var author: [Author]
        
        struct Author: Codable {
            
            var id: Int
            var name: String
            var url: String
            var description: String
            var link: String
            var slug: String
            
            
        }
        
        struct wp:featuredmedia: Codable {
            
        }
        
    }
}
*/
