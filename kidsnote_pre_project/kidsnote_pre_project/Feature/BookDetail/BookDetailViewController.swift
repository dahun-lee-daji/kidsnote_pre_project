//
//  BookDetailViewController.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 9/1/24.
//

import UIKit
import SnapKit
import Combine

final class BookDetailViewController: UIViewController {
    // MARK: - Lifecycle
    private var cancellables: Set<AnyCancellable> = []
    
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
        
        setupViews()
        bind()
        
        viewModel.viewDidLoad()
    }
    
    func bind() {
        viewModel.bookDetailOutput
            .compactMap { $0 }
            .receive(on: RunLoop.main)
            .sink { [weak self] (bookDetail: VolumeDetail) in
                guard let self else { return }
//                bookCoverImageView.image
                bookTitleLabel.text = bookDetail.title
                authorLabel.text = bookDetail.author.description
                bookInfoLabel.text = "\(bookDetail.pageCount)"
                ratingLabel.text = "\(bookDetail.averageRating)"
                reviewCountLabel.text = "\(bookDetail.numberOfRating)"
                bookDescriptionLabel.text = bookDetail.description
            }
            .store(in: &cancellables)
        
        
    }
    
    // MARK: - View Layout
    
    private func setupViews() {
        self.view.backgroundColor = .white
        setupNavigationBar()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [bookCoverImageView, bookTitleLabel, authorLabel, bookInfoLabel,
         freeButton, purchaseButton, ratingView, bookInfoTitleLabel, bookDescriptionLabel].forEach { contentView.addSubview($0) }
        
        [ratingLabel, reviewCountLabel].forEach { ratingView.addSubview($0) }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        
        bookCoverImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(24)
            make.leading.equalTo(contentView).offset(16)
            make.width.equalTo(100)
            make.height.equalTo(150)
        }
        
        bookTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(bookCoverImageView)
            make.leading.equalTo(bookCoverImageView.snp.trailing).offset(16)
            make.trailing.equalTo(contentView).offset(-16)
        }
        
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(bookTitleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalTo(bookTitleLabel)
        }
        
        bookInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(authorLabel.snp.bottom).offset(8)
            make.leading.trailing.equalTo(bookTitleLabel)
        }
        
        freeButton.snp.makeConstraints { make in
            make.top.equalTo(bookCoverImageView.snp.bottom).offset(24)
            make.leading.equalTo(contentView).offset(16)
            make.trailing.equalTo(contentView.snp.centerX).offset(-8)
            make.height.equalTo(44)
        }
        
        purchaseButton.snp.makeConstraints { make in
            make.top.equalTo(freeButton)
            make.leading.equalTo(contentView.snp.centerX).offset(8)
            make.trailing.equalTo(contentView).offset(-16)
            make.height.equalTo(44)
        }
        
        ratingView.snp.makeConstraints { make in
            make.top.equalTo(freeButton.snp.bottom).offset(24)
            make.leading.trailing.equalTo(contentView).inset(16)
        }
        
        ratingLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(ratingView)
        }
        
        reviewCountLabel.snp.makeConstraints { make in
            make.top.equalTo(ratingLabel.snp.bottom).offset(4)
            make.leading.bottom.equalTo(ratingView)
        }
        
        bookInfoTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(ratingView.snp.bottom).offset(24)
            make.leading.trailing.equalTo(contentView).inset(16)
        }
        
        bookDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(bookInfoTitleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalTo(contentView).inset(16)
            make.bottom.equalTo(contentView).offset(-16)
        }
    }
    
    private func setupNavigationBar() {
        navigationItem.hidesBackButton = true
        
        let leftBarButton = UIBarButtonItem(
            image: UIImage(systemName: "chevron.backward"),
            style: .plain,
            target: self,
            action: #selector(backButtonTapped)
        )
        self.title = "도서정보"
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
    // MARK: - View Action
    
    @objc
    private func backButtonTapped(_ sender: UIBarButtonItem) {
        viewModel.backButtonTapped()
    }
    
    // MARK: - View Definition
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let bookCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let bookTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private let bookInfoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let freeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("무료 샘플", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let purchaseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("전체 도서 구매하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let ratingView = UIView()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private let reviewCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let bookInfoTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "책 정보"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let bookDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
}
