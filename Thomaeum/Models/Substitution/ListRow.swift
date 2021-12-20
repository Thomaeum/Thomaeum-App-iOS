//
//  ListRow.swift
//  Thomaeum
//
//  Created by Simon Sure on 20.12.21.
//

import Foundation

struct ListRow: Identifiable {
    var id = UUID()
    var left: String
    var middle: String?
    var right: String?
    var children: [ListRow]?
}
