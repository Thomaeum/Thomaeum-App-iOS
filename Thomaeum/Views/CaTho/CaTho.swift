//
//  CaTho.swift
//  Thomaeum
//
//  Created by Simon Sure on 08.12.21.
//

import SwiftUI

struct CaTho: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 50) {
                    VStack(alignment: .leading) {
                        Text("Angebote")
                            .font(.title2)
                        Divider()
                        Text("(tagesaktuelle) Angebote")
                    }
                    VStack(alignment: .leading) {
                        Text("Kategorie 1")
                            .font(.title2)
                        Divider()
                        Text("Preise der Kategorie 1")
                    }
                    VStack(alignment: .leading) {
                        Text("Kategorie 1")
                            .font(.title2)
                        Divider()
                        Text("Preise der Kategorie 1")
                    }
                    VStack(alignment: .leading) {
                        Text("Kategorie 1")
                            .font(.title2)
                        Divider()
                        Text("Preise der Kategorie 1")
                    }
                }
                .padding()
            }
            .navigationTitle("CaTho")
        }
    }
}

struct CaTho_Previews: PreviewProvider {
    static var previews: some View {
        CaTho()
    }
}
