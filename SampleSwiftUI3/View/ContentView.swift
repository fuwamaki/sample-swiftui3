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
                        .modelContainer(for: Item.self)
                } label: {
                    Text("item list")
                }
                NavigationLink {
                    TodoListView()
                        .modelContainer(for: TodoEntity.self)
                } label: {
                    Text("TODO list")
                }
                NavigationLink {
                    Sample1ScrollView()
                } label: {
                    Text("Sample1 ScrollView")
                }
                NavigationLink {
                    Sample2ScrollView()
                } label: {
                    Text("Sample2 ScrollView")
                }
                NavigationLink {
                    Sample3ScrollView()
                } label: {
                    Text("Sample3 ScrollView")
                }
            }
            .navigationTitle("TOP")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
        .environment(\.locale, .init(identifier: "en"))
}
