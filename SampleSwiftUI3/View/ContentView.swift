//
//  ContentView.swift
//  SampleSwiftUI3
//
//  Created by yusaku maki on 2023/06/14.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    ItemListView()
                } label: {
                    Text("item list")
                }
            }
            .navigationTitle("List")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
        .environment(\.locale, .init(identifier: "en"))
}
