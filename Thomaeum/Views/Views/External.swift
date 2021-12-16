//
//  External.swift
//  Thomaeum
//
//  Created by Simon Sure on 13.12.21.
//

import SwiftUI
import SafariServices
import WebKit

struct SFSafariViewWrapper: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SFSafariViewWrapper>) {
        return
    }
}

struct WebView: UIViewRepresentable {
    var text: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(text, baseURL: nil)
    }
}

struct HTMLText: UIViewRepresentable {
    let html: String
    
    func makeUIView(context: Context) -> some UILabel {
        let label = UILabel()
        DispatchQueue.main.async {
            let data = Data(self.html.utf8)
            if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
                label.attributedText = attributedString
            }
        }
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = 50
        return label
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
