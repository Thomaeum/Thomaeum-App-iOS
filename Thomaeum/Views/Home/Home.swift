//
//  Home.swift
//  Thomaeum
//
//  Created by Simon Sure on 08.11.21.
//

import SwiftUI

struct Home: View {
    @State private var showingSettings = false
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 50) {
                    VStack(alignment: .leading) {
                        Text("Vertretung")
                            .font(.title2)
                        Divider()
                        Text("Heute keine Vertretung.")
                        Text("Für die nächsten Tage steht jedoch folgende Vertertung an.")
                    }
                    VStack(alignment: .leading) {
                        Text("Neuigkeiten")
                            .font(.title2)
                        Divider()
                        Text("Neuigkeiten")
                    }
                    VStack(alignment: .leading) {
                        Text("Debug/Test sectoin")
                            .font(.title2)
                        Divider()
                        Text(String(modelData.testomate))
                        if modelData.articles != nil {
                            Text(String(modelData.articles![0].id))
                            Text(String(modelData.articles!.count))
                        }
                        Text(String(modelData.testomate))
                            .onAppear {
                                modelData.testomate += 1
                                modelData.loadFirstPreview()
                            }
                    }
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
                Settings()
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
