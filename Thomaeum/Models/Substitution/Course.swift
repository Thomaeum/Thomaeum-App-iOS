//
//  Course.swift
//  Thomaeum
//
//  Created by Simon Sure on 18.12.21.
//

import Foundation

struct Course: Identifiable {
    var id: Int
    var subject: String
    var courseID: Int?
    var courseType: Bool?
    var teacher: Teacher
    var grade: Int
    var year: Int
}
