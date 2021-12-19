//
//  SubstitutionData.swift
//  Thomaeum
//
//  Created by Simon Sure on 18.12.21.
//

import Foundation

final class SubstitutionData: ObservableObject {
    @Published var substitutions: [Substitution]
    
    init() {
        var sub = Substitution(id: 1, start: 3, range: 2, regularCourse: Course(id: 1, subject: "Ma", courseID: 2, courseType: true, teacher: Teacher(id: 1, firstName: "Sitzler", lastName: "Grefen", short: "Sz"), grade: 12, year: 2021), changedCourseTeacher: nil, changedCourseRoom: nil, changedCourseSubject: nil, changedCourseType: nil, annotations: nil, type: "EVA")
        
        var sub1 = sub.copy()
        sub1.role = 1
        var sub2 = sub.copy()
        sub2.role = 2
        var sub3 = sub.copy()
        sub3.role = 2
        var sub4 = sub.copy()
        sub4.role = 2
        sub.substituions = [sub1, sub2, sub3, sub4]
        
        self.substitutions = [sub]
    }
}
