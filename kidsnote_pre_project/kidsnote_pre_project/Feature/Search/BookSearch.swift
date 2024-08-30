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
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case view(ViewAction)
    }
    
    var body: some Reducer<State, Action> {
        BindingReducer()
        currentReducer
    }
    
    var currentReducer: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .view(_):
                return .none
                
            case .binding: return .none
            
            }
        }
    }
    
}


extension BookSearch {
    @CasePathable
    enum ViewAction: Equatable {
        case textFieldDeleteButtonTapped
    }
    
}
