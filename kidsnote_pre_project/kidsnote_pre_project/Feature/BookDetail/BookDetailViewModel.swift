//
//  BookDetailViewModel.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 9/1/24.
//

import Foundation

struct BookDetailViewModelActions {
    var pop: () -> Void
}

final class BookDetailViewModel {
    private let actions: BookDetailViewModelActions
    private let useCase: BookDetailUseCase
    
    init(useCase: BookDetailUseCase,actions: BookDetailViewModelActions) {
        self.useCase = useCase
        self.actions = actions
    }
    
    func backButtonTapped() {
        actions.pop()
    }
    
    func viewDidLoad() {
        useCase // TODO: 구현 필요
    }
}
