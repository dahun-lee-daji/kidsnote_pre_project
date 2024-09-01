//
//  BookDetailViewController.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 9/1/24.
//

import UIKit

final class BookDetailViewController: UIViewController {
    // MARK: - Lifecycle

    private var viewModel: BookDetailViewModel!
    
    init(viewModel: BookDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupViews()
    }
    
    // MARK: - View Layout
    
    private func setupViews() {
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.hidesBackButton = true
        
        let leftBarButton = UIBarButtonItem(
            image: UIImage(systemName: "chevron.backward"),
            style: .plain,
            target: self,
            action: #selector(backButtonTapped)
        )
        
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
    // MARK: - View Action
    
    @objc
    private func backButtonTapped(_ sender: UIBarButtonItem) {
        viewModel.backButtonTapped()
    }
}
