//
//  Home.swift
//  Thomaeum
//
//  Created by Simon Sure on 08.11.21.
//

import SwiftUI

struct Home: View {
    @State private var showingSettings = false
    
    @EnvironmentObject var newsData: NewsData
    
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
                        Text(String(newsData.testomate))
                        if newsData.articles != nil {
                            Text(String(newsData.articles![0].id))
                            Text(String(newsData.articles!.count))
                        }
                        Text(String(newsData.testomate))
                            .onAppear {
                                newsData.testomate += 1
                                newsData.loadTenMoreArticles()
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
