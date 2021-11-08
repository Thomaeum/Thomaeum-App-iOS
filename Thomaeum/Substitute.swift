//
//  Substitute.swift
//  Thomaeum
//
//  Created by Simon Sure on 08.11.21.
//

import SwiftUI

struct Substitute: View {
    @State private var showingSubstituteSettings = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text("Show substitution information here.")
            }
            .navigationTitle("Vertretung")
            .toolbar {
                Button {
                    showingSubstituteSettings.toggle()
                } label: {
                    Label("Vertretung Einstellungen", systemImage: "gear")
                }
            }
            .sheet(isPresented: $showingSubstituteSettings) {
                Text("Show substitution settings here.")
            }
        }
    }
}

struct Substitute_Previews: PreviewProvider {
    static var previews: some View {
        Substitute()
    }
}
