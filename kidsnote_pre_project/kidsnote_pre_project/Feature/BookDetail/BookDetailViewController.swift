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
        self.view.backgroundColor = .white
        setupNavigationBar()
        
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
                bookInfoLabel.text = {
                    if let pageCount = bookDetail.pageCount {
                        return "\(pageCount) 페이지"
                    } else {
                        return ""
                    }
                }()
                
                // DefaultValue가 지정되어있으나, 실제로는 표기하지 않는다.
                ratingLabel.text = "\(bookDetail.averageRating ?? 0) \(String(repeating:"★", count: Int(bookDetail.averageRating?.rounded() ?? 0)))"
                reviewCountLabel.text = "Google Play 평점 \(bookDetail.numberOfRating ?? 0) 개"
                bookDescriptionLabel.text = bookDetail.description
                
                setupViews(
                    buttonMode: bookDetail.epubDownloadLink == nil ? .purchaseOnly : .all,
                    ratingMode: bookDetail.averageRating == nil ? .invisible : .visible
                )
                
            }
            .store(in: &cancellables)
        
        
    }
    
    // MARK: - View Layout
    
    private enum ButtonStackMode {
        case all
        case purchaseOnly
    }
    private enum RatingViewMode {
        case visible
        case invisible
    }
    
    private func setupViews(
        buttonMode: ButtonStackMode,
        ratingMode: RatingViewMode
    ) {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [
            bookCoverImageView,
            bookTitleLabel,
            authorLabel,
            bookInfoLabel,
            buttonStackView,
            buttonUpperDivider,
            buttonUnderDivider,
            ratingView,
            bookInfoTitleLabel,
            bookDescriptionLabel,
        ].forEach {
            contentView.addSubview($0)
        }
        
        
        if buttonMode == .all { buttonStackView.addArrangedSubview(freeButton) }
        buttonStackView.addArrangedSubview(purchaseButton)
        
        [ratingLabel, reviewCountLabel].forEach {
            ratingView.addSubview($0)
            $0.isHidden = ratingMode == .invisible ? true : false
        }
        
        setupConstraints(ratingViewMode: ratingMode)
    }
    
    private func setupConstraints(ratingViewMode: RatingViewMode) {
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
        
        buttonUpperDivider.snp.makeConstraints { make in
            make.top.equalTo(bookCoverImageView.snp.bottom).offset(12)
            make.width.equalToSuperview()
            make.height.equalTo(1)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(buttonUpperDivider.snp.bottom).offset(12)
            make.leading.equalTo(contentView).offset(16)
            make.trailing.equalTo(contentView).offset(-16)
            make.height.equalTo(44)
        }
        
        buttonUnderDivider.snp.makeConstraints { make in
            make.top.equalTo(buttonStackView.snp.bottom).offset(12)
            make.width.equalToSuperview()
            make.height.equalTo(1)
        }
        
        ratingView.snp.makeConstraints { make in
            make.top.equalTo(buttonUnderDivider.snp.bottom).offset(12)
            make.leading.trailing.equalTo(contentView).inset(16)
            if ratingViewMode == .invisible {
                make.height.equalTo(0)
            }
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
        label.textColor = .black
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
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let ratingView = UIView()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
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
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let bookDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let buttonUpperDivider: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let buttonUnderDivider: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
}
