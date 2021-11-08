//
//  ContentView.swift
//  Thomaeum
//
//  Created by Simon Sure on 07.11.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            ThomsLine()
                .tabItem {
                    Image(systemName: "newspaper.fill")
                    Text("ThomsLine")
                }
            
            Substitute()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Vertretung")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
