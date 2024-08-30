//
//  BookSearchView.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 8/30/24.
//

import SwiftUI
import ComposableArchitecture

struct BookSearchView: View {
    let store: StoreOf<BookSearch>
    
    let sidePadding: CGFloat = 16
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(spacing: 8) {
                HStack(spacing: 0) {
                    TextField("Play 북에서 검색", text: viewStore.$searchingText)
                    
                    Button {
                        store.send(.view(.textFieldDeleteButtonTapped))
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 16, height: 16)
                    }

                }
                .padding(.horizontal, sidePadding)
                .padding(.vertical, 16)
                
                Divider()
                
                if viewStore.searchingText.isEmpty {
                    Spacer()
                }
                
            }
        }
    }
}

#Preview {
    BookSearchView(
        store: StoreOf<BookSearch>.init(initialState: .init()) {
            BookSearch()
        }
    )
}
