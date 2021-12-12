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
            Image(systemName: "camera")
                .frame(
                    maxWidth: .infinity
                )
            Text(article.title.rendered)
        }
        .background(Color.red)
    }
}

/*struct Card_Previews: PreviewProvider {
    static var previews: some View {
        card(article: ModelData().articles)
    }
}
*/
