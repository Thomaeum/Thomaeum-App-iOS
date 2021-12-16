//
//  card.swift
//  Thomaeum
//
//  Created by Simon Sure on 12.12.21.
//

import SwiftUI

struct Card: View {
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: article.imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .clipped()
                    .cornerRadius(7)
            } placeholder: {
                ProgressView()
                    .frame(height: 200)
            }
            Text(article.title)
                .font(.title)
            HStack {
                Text("\(article.author),")
                Text(article.date)
            }
                .font(.caption)
            Text(article.excerpt)
                .font(.body)
        }
        .multilineTextAlignment(.leading)
        .foregroundColor(.primary)
    }
}

/*struct Card_Previews: PreviewProvider {
    static var previews: some View {
        card(article: ModelData().articles)
    }
}
*/
