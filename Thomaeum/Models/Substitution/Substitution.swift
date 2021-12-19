//
//  Substitution.swift
//  Thomaeum
//
//  Created by Simon Sure on 18.12.21.
//

import Foundation

struct Substitution: Identifiable {
    var id: Int
    var start: Int
    var range: Int
    var regularCourse: Course
    var changedCourseTeacher: Teacher?
    var changedCourseRoom: String?
    var changedCourseSubject: String?
    var changedCourseType: Bool?
    var annotations: String?
    var type: String
    
    var role: Int = 0
    var substituions: [Substitution]?
    
    func copy() -> Substitution {
        return self
    }
}
