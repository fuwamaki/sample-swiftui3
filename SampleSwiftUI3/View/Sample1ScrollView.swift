//
//  Sample1ScrollView.swift
//  SampleSwiftUI3
//
//  Created by yusaku maki on 2023/10/04.
//

import SwiftUI

// https://developer.apple.com/videos/play/wwdc2023/10159/
// のサンプル①
struct Sample1ScrollView: View {
    @State var items: [SampleItem] = (0 ..< 25).map { SampleItem(id: $0) }

    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(items) { item in
                    SampleItemView(item: item)
                }
            }
        }
    }
}

struct SampleItem: Identifiable {
    var id: Int
}

struct SampleItemView: View {
    var item: SampleItem

    var body: some View {
        Text(item.id.description)
            .padding(.vertical)
            .frame(maxWidth: .infinity)
    }
}

#Preview {
    Sample1ScrollView()
}
