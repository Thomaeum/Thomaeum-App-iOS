//
//  ThomaeumApp.swift
//  Thomaeum
//
//  Created by Simon Sure on 07.11.21.
//

import SwiftUI

@main
struct ThomaeumApp: App {
    @StateObject var thomsLineData = ThomsLineData()
    @StateObject var thomaeumNewsData = ThomaeumNewsData()
    @StateObject var substitutionData = SubstitutionData()
    
    init() {
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(thomsLineData)
                .environmentObject(substitutionData)
                .environmentObject(thomaeumNewsData)
                .navigationViewStyle(.stack)
        }
    }
}
