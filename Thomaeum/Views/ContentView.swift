//
//  ContentView.swift
//  Thomaeum
//
//  Created by Simon Sure on 07.11.21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var thomsLineData: ThomsLineData
    @EnvironmentObject var thomaeumNewsData: ThomaeumNewsData
    
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            SubstitutionView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Vertretung")
                }
            
            ThomaeumNewsView()
                .tabItem {
                    Image(systemName: "graduationcap.fill")
                    Text("Aktuelles")
                }
            
            ThomsLineView()
                .tabItem {
                    Image(systemName: "newspaper.fill")
                    Text("ThomsLine")
                }
        }
        .onAppear {
            thomsLineData.initialLoad()
            thomaeumNewsData.initialLoad()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
