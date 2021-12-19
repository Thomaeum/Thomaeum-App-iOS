//
//  ArticleView.swift
//  Thomaeum
//
//  Created by Simon Sure on 12.12.21.
//

import SwiftUI
import WebKit
import SwiftSoup

struct ArticleView: View {
    var article: Article
    
    var body: some View {
        if let content = article.content {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(article.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text(String(article.author)+", "+article.dateToString())
                        .font(.caption)
                    Divider()
                    /*AsyncImage(url: URL(string: article.imageUrl)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                            .frame(height: 200)
                    }
                    Divider()*/
                    VStack(alignment: .leading) {
                        ForEach(content, id: \.self) { element in
                            viewFromElement(element)
                                .padding(.vertical, 6)
                        }
                    }
                }
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .navigationBarTitleDisplayMode(.inline)
            }
            .toolbar {
                Button {
                    let activityVC = UIActivityViewController(activityItems: [article.contentUrl], applicationActivities: nil)
                    UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }

            }
        } else {
            ProgressView()
        }
    }
    
    func viewFromElement(_ element: Element) -> AnyView {
        if element.tagName() == "h1" {
            do {
                return AnyView(Text(try element.text()).font(.title2))
            } catch {}
        } else if element.tagName() == "h2" {
            do {
                return AnyView(Text(try element.text()).font(.title3))
            } catch {}
        }
        
        
        else if element.tagName() == "p" {
            do {
                return AnyView(Text(try element.text()))
            } catch {}
        }
        
        
        else if element.hasClass("wp-block-image") {
            do {
                let imgElement = try element.select("img").first()!
                
                let imgURL = URL(string: try imgElement.attr("src"))
                
                var imgCaption: String? = nil
                if let figcaption = try element.select("figcaption").first() {
                    imgCaption = try figcaption.text()
                }
                
                if imgCaption != nil {
                    return AnyView(VStack(alignment: .center) {
                        AsyncImage(url: imgURL) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                //.frame(height: 200)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .clipped()
                        } placeholder: {
                            ProgressView()
                                .frame(height: 200)
                                .frame(minWidth: 0, maxWidth: .infinity)
                        }
                        Text(imgCaption!)
                            .font(.caption)
                    })
                } else {
                    return AnyView(VStack(alignment: .center) {
                        AsyncImage(url: imgURL) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                //.frame(height: 200)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .clipped()
                        } placeholder: {
                            ProgressView()
                                .frame(height: 200)
                        }
                    })
                }
            } catch {
                print("error: \(error)")
            }
        }
        
        do {
            print(try element.className())
        } catch {}
        print("Element:")
        print(element)
        print("")
        
        return AnyView(
            Link(destination: article.contentUrl) {
                VStack(alignment: .center) {
                Text("Dieser Inhalt ist aktuell leider nur auf der Website verfügbar.")
                    .bold()
                    .padding(10)
                }
                .border(.red, width: 5.0)
                .cornerRadius(7)
                .multilineTextAlignment(.center)
            }
        )
    }
}

/*struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
    }
}*/
