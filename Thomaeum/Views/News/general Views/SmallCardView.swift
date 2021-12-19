//
//  SmallCardView.swift
//  Thomaeum
//
//  Created by Simon Sure on 19.12.21.
//

import SwiftUI

struct SmallCardView: View {
    var article: Article
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.title2)
                Text(String(article.author)+", "+article.dateToString())
                    .font(.caption)
            }
            .multilineTextAlignment(.leading)
            Spacer()
            AsyncImage(url: URL(string: article.imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipped()
                    .cornerRadius(7)
            } placeholder: {
                ProgressView()
                    .frame(width: 120, height: 120)
            }
        }
        .frame(height: 120)
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

/*struct SmallCardView_Previews: PreviewProvider {
    static var previews: some View {
        SmallCardView()
    }
}*/
