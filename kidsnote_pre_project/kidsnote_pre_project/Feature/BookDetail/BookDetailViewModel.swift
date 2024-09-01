//
//  BookDetailViewModel.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 9/1/24.
//

import Foundation
import Combine

struct BookDetailViewModelActions {
    var pop: () -> Void
}

final class BookDetailViewModel {
    private let actions: BookDetailViewModelActions
    private let useCase: BookDetailUseCase
    
    let id: String
    
    private var bookDetail: CurrentValueSubject<VolumeDetail?, Never> = .init(nil)
    
    var bookDetailOutput: AnyPublisher<VolumeDetail?, Never> {
        self.bookDetail.eraseToAnyPublisher()
    }
    
    init(
        useCase: BookDetailUseCase,
        actions: BookDetailViewModelActions,
        id: String
    ) {
        self.useCase = useCase
        self.actions = actions
        self.id = id
    }
    
    func backButtonTapped() {
        actions.pop()
    }
    
    func viewDidLoad() {
        Task {
            // TODO: 구현 필요
            do {
                let result = try await useCase.getBookDetail(id: id)
                bookDetail.send(result)
            } catch {
                Logger.event(message: error.localizedDescription)
            }
        }
    }
}
