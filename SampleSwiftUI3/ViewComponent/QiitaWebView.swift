//
//  QiitaWebView.swift
//  SampleSwiftUI3
//
//  Created by yusaku maki on 2023/10/06.
//

import SwiftUI
import WebKit

struct QiitaWebView: View {
    let title: String
    let url: String

    var body: some View {
        WebView(url: URL(string: url)!)
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle(Text(title), displayMode: .inline)
    }
}

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView(frame: .zero)
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let req = URLRequest(url: url)
        uiView.load(req)
    }
}
