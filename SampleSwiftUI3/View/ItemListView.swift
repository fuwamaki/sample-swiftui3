//
//  ItemListView.swift
//  SampleSwiftUI3
//
//  Created by yusaku maki on 2023/06/30.
//

import SwiftUI
import SwiftData
import TipKit

struct ItemListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    private let tip = AddTip()

    init() {
        Tips.showAllTipsForTesting()
        try? Tips.configure([
            .displayFrequency(.immediate),
            .datastoreLocation(.applicationDefault)
        ])
    }

    var body: some View {
        List {
            TipView(tip)
            ForEach(items) { item in
                NavigationLink {
                    Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                } label: {
                    Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                }
            }
            .onDelete(perform: deleteItems)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
                    .popoverTip(tip)
            }
            ToolbarItem {
                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
        .navigationTitle("Select an item")
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ItemListView()
        .modelContainer(for: Item.self, inMemory: true)
        .environment(\.locale, .init(identifier: "ja"))
}

struct AddTip: Tip {
    var title: Text {
        Text("Add Button")
    }
}
// TipKitは操作を教える目的（教育）
// 操作を促す（promotional）、エラーメッセージ、複雑なもの は非推薦
