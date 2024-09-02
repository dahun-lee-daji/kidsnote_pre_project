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
        var selectedOrderBy: OrderBy = .relevance
        var delegate = DelegateState()
        var isSegmentedPickerVisible = false
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case view(ViewAction)
        case outer(OuterAction)
        
        case appendBooks(books: [VolumeInformation])
        case setBooks(books: [VolumeInformation])
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
                
            case .setBooks(books: let books):
                state.books = books
                return .none
                
            case .view(let viewAction):
                return reduceViewAction(state: &state, action: viewAction)
                
            case .binding(\.$searchingText):
                state.isSegmentedPickerVisible = false
                state.books = []
                
                return .run { _ in
                    await bookSearchClient.reset()
                }
                
            case .binding: return .none
            
            case .outer(let outerActon):
                if case .eraseDelegateState = outerActon {
                    state.delegate = DelegateState()
                }
                return .none
                
            }
        }
    }
    
}

// - MARK: DelegateState & OuterAction
extension BookSearch {
    struct DelegateState: Equatable {
        var tappedCellID: String?
    }
    
    @CasePathable
    enum OuterAction {
        case eraseDelegateState
    }
}

// - MARK: ViewActions

extension BookSearch {
    @CasePathable
    enum ViewAction: Equatable {
        case textFieldDeleteButtonTapped
        case textFieldOnSubmit
        
        case segmentedPickerTapped(OrderBy)
        
        case refreshBookList
        case lastCellAppeared
        case bookCellTapped(id: String)
    }
    
    private func reduceViewAction(
        state: inout State,
        action: ViewAction
    ) -> Effect<Action> {
        switch action {
        case .textFieldDeleteButtonTapped:
            state.searchingText = ""
            state.books = []
            state.isSegmentedPickerVisible = false
            return .none
            
        case .textFieldOnSubmit:
            state.books = []
            state.isSegmentedPickerVisible = true
            return .run { [
                searchingText = state.searchingText,
                orderBy = state.selectedOrderBy
            ] send in
                let searchResult = try await bookSearchClient.searchBooks(
                    "\(searchingText)",
                    orderBy
                )
                
                await send(.appendBooks(books: searchResult.searchedItems))
            } catch: { error, _ in
                Logger.event(message: error.localizedDescription)
            }
            
        case .segmentedPickerTapped(let selected):
            state.selectedOrderBy = selected
            state.books = []
            return .run { [
                searchingText = state.searchingText,
                orderBy = state.selectedOrderBy
            ] send in
                let searchResult = try await bookSearchClient.searchBooks(
                    "\(searchingText)",
                    orderBy
                )
                
                await send(.appendBooks(books: searchResult.searchedItems))
            } catch: { error, _ in
                Logger.event(message: error.localizedDescription)
            }
            
        case .refreshBookList:
            return .run { send in
                let searchResult = try await bookSearchClient.refreshPagination()
                await send(.setBooks(books: searchResult.searchedItems))
            } catch: { error, _ in
                Logger.event(message: error.localizedDescription)
            }
            
        case .lastCellAppeared:
            return .run { send in
                let searchResult = try await bookSearchClient.excutePagination()
                await send(.appendBooks(books: searchResult.searchedItems))
            } catch: { error, _ in
                Logger.event(message: error.localizedDescription)
            }
            
        case .bookCellTapped(id: let id):
            state.delegate.tappedCellID = id
            return .none
        }
    }
}

enum OrderBy: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    
    case relevance
    case newest
    
    var title: String {
        switch self {
        case .relevance: return "관련순"
        case .newest: return "최신순"
        }
    }
}
