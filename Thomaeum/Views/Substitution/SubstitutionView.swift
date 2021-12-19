//
//  Substitute.swift
//  Thomaeum
//
//  Created by Simon Sure on 08.11.21.
//

import SwiftUI

struct SubstitutionView: View {
    @EnvironmentObject var substitutionData: SubstitutionData
    
    @State private var showingSubstituteSettings = false
    
    var body: some View {
        NavigationView {
            List(substitutionData.substitutions, children: \.substituions) { substitution in
                Text(substitution.type)
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
        SubstitutionView()
    }
}
