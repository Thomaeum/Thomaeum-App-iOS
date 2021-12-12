//
//  article.swift
//  Thomaeum
//
//  Created by Simon Sure on 11.11.21.
//

import Foundation
import SwiftUI

struct Article: Codable, Identifiable {
    var id: Int
    var date: String
    //var title: String
    //var excerpt: String
    
    //private var authors: [author]
    /*var author: String /*{
        authors[0].name
    }*/*/
    
    //private var featuredMediaURL: String
    /*var featuredMedia: Image {
        Image(featuredMediaURL)
    }*/
    
    //var content: String? = nil
    //var link: String? = nil
    
    enum CodingKeys: String, CodingKey {
        case id
        case date
        //case title = "title.rendered"
        
        //case excerpt = "excerpt.rendered"
        //case author = "_embedded.author[0].name"
        //case featuredMediaURL = "_embedded.wp:featuredmedia[0].source_url"
        
        /*case link = "link"
        case content = "content.rendered"*/
    }
}

/*struct author: Codable, Hashable {
    var name: String
}*/
