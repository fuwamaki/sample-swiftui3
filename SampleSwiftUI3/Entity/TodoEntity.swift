//
//  TodoEntity.swift
//  SampleSwiftUI3
//
//  Created by yusaku maki on 2023/10/03.
//

import Foundation
import SwiftData

@Model
final class TodoEntity {
    var text: String
    var status: TodoStatus
    var createdAt: Date
    var updatedAt: Date

    init(text: String) {
        self.text = text
        self.status = .todo
        self.createdAt = Date()
        self.updatedAt = Date()
    }
}
