//
//  Sample3ScrollView.swift
//  SampleSwiftUI3
//
//  Created by yusaku maki on 2023/10/04.
//

import SwiftUI

// Sample2ScrollViewを参考につくった機能。
struct Sample3ScrollView: View {
    private struct Item: Identifiable {
        var id: UUID
        var color: Color
    }

    @State private var targetItemId: Item.ID? = nil
    @State private var items: [Item] = [
        Item(id: UUID(), color: .cyan),
        Item(id: UUID(), color: .mint),
        Item(id: UUID(), color: .pink),
    ]

    var body: some View {
        ScrollView {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10.0) {
                    ForEach(items) { item in
                        item.color
                            .aspectRatio(2, contentMode: .fit)
                            .containerRelativeFrame(
                                [.horizontal], count: 1, spacing: 0.0
                            )
                            .clipShape(.rect(cornerRadius: 20.0))
                            .scrollTransition(axis: .horizontal) { content, phase in
                                content
                                    .scaleEffect(
                                        x: phase.isIdentity ? 1.0 : 0.70,
                                        y: phase.isIdentity ? 1.0 : 0.70)
                            }
                    }
                }
                .scrollTargetLayout()
            }
            .contentMargins(.horizontal, 20.0)
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: $targetItemId)
            .scrollIndicators(.never)
            HStack {
                Button(action: {
                    targetItemId = items[0].id
                }, label: {
                    Text("Cyan")
                })
                Button(action: {
                    targetItemId = items[1].id
                }, label: {
                    Text("Mint")
                })
                Button(action: {
                    targetItemId = items[2].id
                }, label: {
                    Text("Pink")
                })
            }
        }
    }
}

#Preview {
    Sample3ScrollView()
}
