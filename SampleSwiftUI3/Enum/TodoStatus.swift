//
//  TodoStatus.swift
//  SampleSwiftUI3
//
//  Created by yusaku maki on 2023/10/03.
//

import Foundation

// SwiftDataの値型として利用する場合はCodableをつける。
enum TodoStatus: Int, Codable, CaseIterable, Identifiable {
    case todo = 0
    case doing = 1
    case done = 2

    var id: Int {
        self.rawValue
    }

    var title: String {
        return switch self {
        case .todo: "TODO"
        case .doing: "DOING"
        case .done: "DONE"
        }
    }
}
