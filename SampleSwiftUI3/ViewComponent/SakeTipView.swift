//
//  SakeTipView.swift
//  SampleSwiftUI3
//
//  Created by yusaku maki on 2023/10/30.
//

import Foundation
import TipKit

struct AddSakeTip: Tip {
    var title: Text {
        Text("Add sake with this plus button")
    }
}

struct FavoriteSakeTip: Tip {

    @Parameter
    static var isShowSakeView: Bool = false

    static let numerOfTimesOpened: Event = Event(id: "com.example.TipKit.numberOfTimesOpened")

    var title: Text {
        Text("Favorites")
            .foregroundStyle(.teal)
            .font(.body)
    }

    var message: Text? {
        Text("When you add sake to your favorites, it will be at the top of the list.")
    }

    // サイズ変更できひん
    var image: Image? {
        Image(systemName: "star")
    }

    var actions: [Action] {
        Action(title: "dismiss") {
            FavoriteSakeTip.isShowSakeView = true
        }
    }

    var options: [TipOption] {
        [MaxDisplayCount(1)]
    }

    var rules: [Rule] {
        #Rule(Self.$isShowSakeView) { !$0 }
//        #Rule(Self.numerOfTimesOpened) {
//            $0.donations.count == 1
//        }
    }
}
