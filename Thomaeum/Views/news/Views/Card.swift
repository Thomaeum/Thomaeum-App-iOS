//
//  card.swift
//  Thomaeum
//
//  Created by Simon Sure on 12.12.21.
//

import SwiftUI

struct Card: View {
    var article: ArticleService
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Image(systemName: "camera")
                    .frame(
                        maxWidth: .infinity
                    )
            }
                .frame(
                    height: 120
                )
            HStack {
                Text("\(article.embedded.author[0].name),")
                Text(article.date)
            }
                .font(.caption)
            Text(article.title.rendered)
                .font(.title)
            Text(article.excerpt.rendered)
                .font(.body)
        }
        .multilineTextAlignment(.leading)
        .foregroundColor(.primary)
        .background(Color.red)
    }
}

/*struct Card_Previews: PreviewProvider {
    static var previews: some View {
        card(article: ModelData().articles)
    }
}
*/
