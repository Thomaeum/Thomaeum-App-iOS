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
    
    func createListRow() -> ListRow {
        var left: String = ""
        if range > 1 {
            left = "\(start)-\(start+range-1)"
        } else {
            left = "\(start)"
        }
        
        var middle: String
        middle = "\(regularCourse.subject)"
        switch regularCourse.courseType {
            case true:
                middle += "-LK"
                print("true")
            case false:
                middle += "-GK"
            default:
                print("what ever")
        }
        if regularCourse.courseID != nil {
            middle += String(regularCourse.id)
        }
        middle += " (\(regularCourse.teacher.short))"
        
        var right: String = ""
        if type == "Raumvertretung" && changedCourseRoom != nil {
            right = "Raum: \(changedCourseRoom!)"
        } else {
            right = type
        }
        
        var children: [ListRow] = []
        if changedCourseRoom != nil {
            children.append(ListRow(left: changedCourseRoom!))
        }
        if changedCourseTeacher != nil {
            children.append(ListRow(left: changedCourseTeacher!.short))
        }
        if changedCourseSubject != nil {
            var lef: String
            lef = changedCourseSubject!
            switch changedCourseType {
                case true:
                    lef += "-LK"
                case false:
                    lef += "-GK"
                default:
                    print("nope")
            }
            children.append(ListRow(left: lef))
        }
        if annotations != nil {
            children.append(ListRow(left: annotations!))
        }
        
        if children.isEmpty {
            return ListRow(left: left, middle: middle, right: right)
        }
    
        return ListRow(left: left, middle: middle, right: right, children: children)
    }
}
