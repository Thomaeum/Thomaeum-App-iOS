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
                VStack(spacing: 50) {
                    VStack(alignment: .leading) {
                        Text("5A")
                            .font(.title2)
                        Divider()
                        HStack {
                            Text("Stunde")
                            Text("Fach")
                            Text("Raum")
                            Text("Lehrer")
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("6A")
                            .font(.title2)
                        Divider()
                    }
                    VStack(alignment: .leading) {
                        Text("7A")
                            .font(.title2)
                        Divider()
                    }
                    VStack(alignment: .leading) {
                        Text("8A")
                            .font(.title2)
                        Divider()
                    }
                    VStack(alignment: .leading) {
                        Text("9A")
                            .font(.title2)
                        Divider()
                    }
                    VStack(alignment: .leading) {
                        Text("EF")
                            .font(.title2)
                        Divider()
                    }
                    VStack(alignment: .leading) {
                        Text("Q1")
                            .font(.title2)
                        Divider()
                    }
                    VStack(alignment: .leading) {
                        Text("Q2")
                            .font(.title2)
                        Divider()
                    }
                }
                .padding()
            }
            .navigationTitle("Vertretung")
            .toolbar {
                Button {
                    showingSubstituteSettings.toggle()
                } label: {
                    Label("Vertretung Einstellungen", systemImage: "line.3.horizontal.decrease.circle")
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
