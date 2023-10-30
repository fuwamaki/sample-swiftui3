//
//  SakeEntity.swift
//  SampleSwiftUI3
//
//  Created by yusaku maki on 2023/10/30.
//

import Foundation
import SwiftData

@Model
final class SakeEntity {
    var name: String
    var isFavorite: Bool
    var createdAt: Date

    init(name: String) {
        self.name = name
        self.isFavorite = false
        self.createdAt = Date()
    }
}
