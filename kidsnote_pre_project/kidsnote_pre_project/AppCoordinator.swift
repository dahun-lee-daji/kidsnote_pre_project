//
//  AppCoordinator.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 9/1/24.
//

import UIKit
import ComposableArchitecture
import Combine
import SwiftUI

final class AppCoordinator {
    private weak var navigationController: UINavigationController!
    private var cancellables: Set<AnyCancellable> = []
    
    private var bookSearch: StoreOf<BookSearch>!
    
    init(navigationController: UINavigationController) {
        self.bookSearch = StoreOf<BookSearch>(initialState: BookSearch.State()) {
            BookSearch()
        }
        self.navigationController = navigationController
    }
    
    func start() {
        let rootView = BookSearchView(store: bookSearch)
        let bookSearchViewHostingController = UIHostingController(rootView: rootView)
        self.navigationController.viewControllers = [bookSearchViewHostingController]
        bind()
    }
    
    private func bind() {
        ViewStore(bookSearch, observe: { $0.delegate.tappedCellID }).publisher
            .sink { [weak self] detailViewID in
                guard 
                    let self = self,
                    let detailViewID
                else { return }
                
                let bookDetailVM = BookDetailViewModel(
                    useCase: .init(),
                    actions: .init(pop: self.pop),
                    id: detailViewID
                )
                let bookDetailVC = BookDetailViewController(viewModel: bookDetailVM)
                self.navigationController.pushViewController(
                    bookDetailVC,
                    animated: true
                )
                self.navigationController.setNavigationBarHidden(false, animated: false)
                
            }
            .store(in: &cancellables)
    }
    
    func pop() {
        bookSearch.send(.outer(.eraseDelegateState))
        navigationController.popViewController(animated: true)
        self.navigationController.setNavigationBarHidden(true, animated: false)
    }
    
}
