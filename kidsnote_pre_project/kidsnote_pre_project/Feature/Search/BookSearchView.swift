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
    @Namespace var namespace
    
    let sidePadding: CGFloat = 16
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    TextField("Play 북에서 검색", text: viewStore.$searchingText)
                        .onSubmit {
                            store.send(.view(.textFieldOnSubmit))
                        }
                    
                    Button {
                        store.send(.view(.textFieldDeleteButtonTapped))
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 16, height: 16)
                    }
                    .foregroundStyle(Color.gray)

                }
                .padding(.horizontal, sidePadding)
                .padding(.vertical, 16)
                
                Divider()
                contentsArea
            }
        }
    }
    
    @ViewBuilder
    var contentsArea: some View {
        WithViewStore(store, observe: { $0 }) { (viewStore: ViewStoreOf<BookSearch>) in
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    if viewStore.isSegmentedPickerVisible {
                        segmentedPicker
                        Divider()
                    }
                    
                    if viewStore.books.isEmpty {
                        Spacer()
                    } else {
                        Group {
                            HStack {
                                Text("Google Play 검색결과")
                                    .font(.system(size: 24))
                                Spacer()
                            }
                            .padding(.vertical, 16)
                            
                            LazyVStack(spacing: 16) {
                                ForEach(viewStore.books, id: \.id) { book in
                                    bookCell(book)
                                        .onTapGesture {
                                            store.send(.view(.bookCellTapped(id: book.id)))
                                        }
                                        .onAppear {
                                            if viewStore.books.last?.id == book.id {
                                                viewStore.send(.view(.lastCellAppeared))
                                            }
                                        }
                                }
                            }
                            
                            ProgressView()
                        }
                        .padding(.horizontal, sidePadding)
                    }
                }
            }
            .refreshable {
                Task { @MainActor in
                    await store.send(.view(.refreshBookList)).finish()
                }
            }
        }
    }
    
    @ViewBuilder
    var segmentedPicker: some View {
        WithViewStore(store, observe: { $0.selectedOrderBy }) { viewStore in
            HStack {
                ForEach(OrderBy.allCases, id: \.id) { someOrderBy in
                    let isSelected = someOrderBy == viewStore.state
                    
                    Text(someOrderBy.title)
                        .foregroundStyle(isSelected ? Color.blue : Color.gray)
                        .padding(.vertical, 12)
                        .overlay(alignment: .bottom) {
                            if isSelected {
                                Rectangle()
                                    .fill(Color.blue)
                                    .frame(height: 2)
                                    .matchedGeometryEffect(id: "underBar", in: namespace)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .clipShape(Rectangle())
                        .onTapGesture {
                            store.send(.view(.segmentedPickerTapped(someOrderBy)))
                        }
                    
                }
            }
            .animation(.easeInOut, value: viewStore.state)
        }
    }
    
    @ViewBuilder
    private func bookCell(_ book: VolumeInformation) -> some View {
        HStack(alignment: .center, spacing: 12) {
            SkeletonLoadingImage(source: book.volumeInfo.imageURL.url)
                .frame(width:96, height: 120)
            
            ZStack(alignment: .topLeading) {
                Color.clear
                VStack(alignment: .leading, spacing: 4) {
                    Text(book.volumeInfo.title)
                        .lineLimit(2)
                        .font(.system(size: 16, weight: .bold))
                    Group {
                        Text(book.volumeInfo.author.description)
                        if let ratingDescription = book.volumeInfo.ratingDescription {
                            Text(ratingDescription)
                        }
                    }
                    .lineLimit(1)
                    .font(.system(size: 14, weight: .regular))
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
