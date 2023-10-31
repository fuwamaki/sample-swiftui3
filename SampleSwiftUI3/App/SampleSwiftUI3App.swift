//
//  SampleSwiftUI3App.swift
//  SampleSwiftUI3
//
//  Created by yusaku maki on 2023/06/14.
//

import SwiftUI
import TipKit

@main
struct SampleSwiftUI3App: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    // 毎回表示するように。
//                    Tips.showAllTipsForTesting()
                    // 特定のTipsだけ毎回表示するように
//                    Tips.showTipsForTesting([AddSakeTip.self])
                    // リセットする
                    try? Tips.resetDatastore()
                    // すべて表示されなくなる
//                    Tips.hideAllTipsForTesting()
                    // 特定のTipsだけ表示しなくする
//                    Tips.hideTipsForTesting([AddSakeTip.self])
                    // 一度だけ表示
                    // NOTE: バツボタンを押さないと、何度も表示される！？
                    try? Tips.configure([
                        .displayFrequency(.immediate),
                        .datastoreLocation(.applicationDefault)
                    ])
                }
        }
    }
}
