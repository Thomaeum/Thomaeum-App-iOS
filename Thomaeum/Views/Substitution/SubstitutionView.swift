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
            List(substitutionData.listrow, children: \.children) { row in
                HStack {
                    HStack {
                        Text(row.left)
                        Spacer()
                    }
                    .frame(minWidth: 40)
                    if row.middle != nil {
                        Text(row.middle!)//.background(Color.red)
                    }
                    Spacer().background(Color.green)
                    if row.right != nil {
                        Text(row.right!)//.background(Color.red)
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                //.background(Color.gray)
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
