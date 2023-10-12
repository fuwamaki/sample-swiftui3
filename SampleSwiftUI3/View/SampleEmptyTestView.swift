//
//  SampleEmptyTestView.swift
//  SampleSwiftUI3
//
//  Created by yusaku maki on 2023/10/12.
//

import SwiftUI

struct SampleEmptyTestView: View {
    var body: some View {
        ContentUnavailableView(
            "title",
            systemImage: "tray.fill",
            description: Text("description")
        )
    }
}

#Preview {
    SampleEmptyTestView()
}
