//
//  AppRoot.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 8/31/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct AppRoot: Reducer {
    struct State: Equatable {
        var bookSearch = BookSearch.State()
    }
    
    enum Action {
        case bookSearch(BookSearch.Action)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
        
        Scope(state: \.bookSearch, action: \.bookSearch) {
            BookSearch()
                .dependency(\.bookSearchClient, .liveValue)
        }
        
    }
}
