//
//  SampleEmptyView.swift
//  SampleSwiftUI3
//
//  Created by yusaku maki on 2023/10/06.
//

import SwiftUI

struct SampleEmptyView: View {

    private enum LoadingState {
        case initialize
        case requesting
        case requested
    }

    private var apiClient = APIClient()
    @State private var keyword: String = ""
    @State private var loadingState: LoadingState = .initialize
    @State private var items: [QiitaItem] = []

    var body: some View {
        ZStack {
            VStack {
                List(items) { item in
                    NavigationLink(
                        destination: QiitaWebView(
                            title: item.title,
                            url: item.url
                        )
                    ) {
                        HStack {
                            AsyncImage(url: item.profileImageUrl) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                ProgressView()
                                    .tint(.teal)
                            }
                            .frame(width: 40, height: 40)
                            .mask(RoundedRectangle(cornerRadius: 20))
                            Text(item.title)
                        }
                    }
                }
                .overlay {
                    if items.isEmpty, loadingState == .requested {
                        ContentUnavailableView.search
                    }
                }
            }
            if loadingState == .requesting {
                ProgressView()
                    .scaleEffect(1.5, anchor: .center)
                    .tint(.teal)
            }
        }
        .navigationTitle("Search Qiita Item")
        .searchable(text: $keyword)
        .onSubmit(of: .search, {
            Task {
                self.loadingState = .requesting
                do {
                    self.items = try await apiClient.fetchQiitaItem(query: keyword)
                } catch let error {
                    debugPrint(error.localizedDescription)
                }
                self.loadingState = .requested
            }
        })
        .accentColor(.teal)
    }
}

#Preview {
    SampleEmptyView()
}
