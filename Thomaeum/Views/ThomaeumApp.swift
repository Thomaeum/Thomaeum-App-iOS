//
//  ThomaeumApp.swift
//  Thomaeum
//
//  Created by Simon Sure on 07.11.21.
//

import SwiftUI

@main
struct ThomaeumApp: App {
    @StateObject var newsData = NewsData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(newsData)
                .navigationViewStyle(.stack)
        }
    }
}
