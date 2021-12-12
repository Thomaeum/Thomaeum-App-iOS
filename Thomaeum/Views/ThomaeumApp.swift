//
//  ThomaeumApp.swift
//  Thomaeum
//
//  Created by Simon Sure on 07.11.21.
//

import SwiftUI

@main
struct ThomaeumApp: App {
    @StateObject var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
