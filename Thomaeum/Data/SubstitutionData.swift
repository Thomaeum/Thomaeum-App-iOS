//
//  SubstitutionData.swift
//  Thomaeum
//
//  Created by Simon Sure on 18.12.21.
//

import Foundation

final class SubstitutionData: ObservableObject {
    @Published var substitutions: [Substitution] = []
    @Published var listrow: [ListRow] = []
    
    init() {
        let sub = Substitution(id: 1, start: 3, range: 2, regularCourse: Course(id: 1, subject: "Ma", courseID: 2, courseType: true, teacher: Teacher(id: 1, firstName: "Adelheit", lastName: "Sitzler-Grefen", short: "Sz"), grade: 12, year: 2021), changedCourseTeacher: nil, changedCourseRoom: "A-101", changedCourseSubject: "Ma", changedCourseType: true, annotations: "Weil Anmerkungen geil sind, steht hier einfach ganz viel Text. Schließlich möchte man ja sehen, wie das ganze auch mit ganz viel unnötigen Informationen aussieht, oder etwa niht? Nein? Mhhh... Da sage ich nur: DOCH!!!!", type: "Raumvertretung")
        self.substitutions.append(sub)
        
        let sub2 = Substitution(id: 1, start: 5, range: 1, regularCourse: Course(id: 9, subject: "En", courseID: 8, courseType: false, teacher: Teacher(id: 5, firstName: "Jens", lastName: "Strohmeyer", short: "Js"), grade: 12, year: 2021), changedCourseTeacher: nil, changedCourseRoom: nil, changedCourseSubject: nil, changedCourseType: nil, annotations: "Guckt auf Teams ihr Honks!!!!", type: "EVA")
        self.substitutions.append(sub2)
        
        listrow = substitutions.map({ substitution in
            return substitution.createListRow()
        })
        print(listrow)
    }
}
