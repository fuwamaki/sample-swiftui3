//
//  SakeListView.swift
//  SampleSwiftUI3
//
//  Created by yusaku maki on 2023/10/30.
//

import SwiftUI
import SwiftData
import TipKit

struct SakeListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var sakeList: [SakeEntity]
    @State private var isAddViewPresented: Bool = false
    @State private var inputText: String = ""

    var list: [SakeEntity] {
        sakeList
            .sorted { $0.createdAt < $1.createdAt }
            .sorted { $0.isFavorite && !$1.isFavorite }
    }

    var body: some View {
        List {
            TipView(FavoriteSakeTip(), arrowEdge: .bottom)
            ForEach(list) { sake in
                HStack {
                    Text(sake.name)
                    Spacer()
                    Button(action: {
                        toggleFavorite(sake)
                    }, label: {
                        if sake.isFavorite {
                            Image(systemName: "star.fill")
                        } else {
                            Image(systemName: "star")
                        }
                    })
                }
            }
        }
        .toolbar {
            ToolbarItem {
                Button(action: {
                    isAddViewPresented.toggle()
                }, label: {
                    Label("Add Sake", systemImage: "plus")
                })
                .buttonStyle(.bordered)
                .popoverTip(AddSakeTip())
            }
        }
        .navigationTitle("Sake List")
        .alert("add Sake", isPresented: $isAddViewPresented) {
            TextField("input sake name", text: $inputText)
            Button("Cancel") {
                isAddViewPresented.toggle()
            }
            Button("Add") {
                guard !inputText.isEmpty else { return }
                withAnimation {
                    modelContext.insert(SakeEntity(name: inputText))
                }
                inputText = ""
            }
        }
    }

    private func toggleFavorite(_ entity: SakeEntity) {
        withAnimation {
            entity.isFavorite.toggle()
            do {
                try modelContext.save()
            } catch let error {
                print(error.localizedDescription.debugDescription)
            }
        }
    }
}

#Preview {
    SakeListView()
}
