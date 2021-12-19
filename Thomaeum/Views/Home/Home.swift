//
//  Home.swift
//  Thomaeum
//
//  Created by Simon Sure on 08.11.21.
//

import SwiftUI

struct Home: View {
    @State private var showingSettings = false
    @EnvironmentObject var thomsLineData: ThomsLineData
    @EnvironmentObject var thomaeumNewsData: ThomaeumNewsData
    @EnvironmentObject var substitutionData: SubstitutionData
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(spacing: 50) {
                        VStack(alignment: .leading) {
                            Text("Vertretung")
                                .font(.title)
                            Divider()
                            Text("Hier kommt die Vertretung hin.")
                        }
                        .padding(.horizontal)
                        
                    }
                }
                if thomsLineData.articles != nil, let arr = newsArray(thomsLineData.articles!, thomaeumNewsData.articles!) {
                    VStack(alignment: .leading) {
                        Text("Neuigkeiten")
                            .font(.title)
                        Divider()
                    }
                    .padding(.horizontal)
                    TabView {
                        ForEach(arr) { article in
                            VStack {
                                NavigationLink {
                                    ArticleView(article: article)
                                        .onAppear {
                                            if article.outlet == "ThomsLine" {
                                                print("loading thomsline")
                                                thomsLineData.loadCompleteArticleByID(article.id)
                                            } else if article.outlet == "Thomaeum" {
                                                print("loading thomaeum")
                                                thomaeumNewsData.loadCompleteArticleByID(article.id)
                                            }
                                        }
                                } label: {
                                    SmallCardView(article: article)
                                        .padding(.horizontal)
                                        .foregroundColor(.primary)
                                }
                                Spacer()
                            }
                        }
                    }
                    .tabViewStyle(.page)
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    .frame(height: 165)
                }
                Spacer(minLength: 10)
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
    
    func newsArray(_ arrayOne: [Article], _ arrayTwo: [Article]) -> [Article]? {
        let arrayCombined: [Article] = arrayOne + arrayTwo
        let arrayFiltered: [Article?]
        let arrayReduced: [Article]
        let array: [Article]
        var date = Date()
        
        
        date.addTimeInterval(TimeInterval(-432000)) //normal
        //date.addTimeInterval(TimeInterval(-172800)) //testing
        //date.addTimeInterval(TimeInterval(-6382400)) //lengthened, to enable the visual
        print("date: \(date)")
        
        arrayFiltered = arrayCombined.map({ article in
            guard article.date > date else {
                //articles to old
                return nil
            }
            return article
        })
        
        arrayReduced = arrayFiltered.compactMap { $0 }
        array = arrayReduced.sorted(by: { $0.date.compare($1.date) == .orderedDescending})
        
        if array.isEmpty {
            return nil
        } else {
            return array
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
