//
//  Home.swift
//  Thomaeum
//
//  Created by Simon Sure on 08.11.21.
//

import SwiftUI

struct Home: View {
    @State private var showingSettings = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Vertretungsplanes")
                        .font(.headline)
                        .padding(.bottom)
                    Text("Neuigkeiten")
                        .font(.headline)
                    Text("hier")
                }
                .padding()
            }
            .navigationTitle("Thomaeum")
            .toolbar {
                Button {
                    showingSettings.toggle()
                } label: {
                    Label("Einstellungen", systemImage: "gear")
                }
            }
            .sheet(isPresented: $showingSettings) {
                Text("Hier")
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
