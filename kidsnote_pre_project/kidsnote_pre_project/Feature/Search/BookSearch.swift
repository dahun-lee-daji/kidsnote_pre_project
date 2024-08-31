//
//  BookSearch.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 8/30/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct BookSearch: Reducer {
    struct State: Equatable {
        @BindingState var searchingText: String = ""
        var books: [VolumeInformation] = []
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case view(ViewAction)
        
        case appendBooks(books: [VolumeInformation])
    }
    
    @Dependency(\.bookSearchClient) var bookSearchClient
    
    var body: some Reducer<State, Action> {
        BindingReducer()
        currentReducer
    }
    
    var currentReducer: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case .appendBooks(books: let books):
                state.books.append(contentsOf: books)
                return .none
                
            case .view(let viewAction):
                return reduceViewAction(state: &state, action: viewAction)
                
            case .binding: return .none
            
            }
        }
    }
    
}


extension BookSearch {
    @CasePathable
    enum ViewAction: Equatable {
        case textFieldDeleteButtonTapped
        case textFieldOnSubmit
    }
    
    private func reduceViewAction(
        state: inout State,
        action: ViewAction
    ) -> Effect<Action> {
        switch action {
        case .textFieldDeleteButtonTapped: return .none
        case .textFieldOnSubmit:
            return .run { [searchingText = state.searchingText] send in
                let searchResult = try await bookSearchClient.searchBooks("\(searchingText)")
                
                await send(.appendBooks(books: searchResult.searchedItems))
            } catch: { error, _ in
                Logger.event(message: error.localizedDescription)
            }
        }
    }
}
