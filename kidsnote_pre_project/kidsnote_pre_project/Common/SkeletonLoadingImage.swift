//
//  SkeletonLoadingImage.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 9/2/24.
//

import SwiftUI
import UIKit
import SnapKit

struct SkeletonLoadingImage: View {
    @State var showingImage: UIImage?
    @State private var flag = false
    
    let source: String?
    
    private let animation = Animation
        .easeInOut(duration: 0.65)
        .delay(0.05)
        .repeatForever(autoreverses: true)
    
    var body: some View {
        Group {
            if let showingImage {
                Image(uiImage: showingImage)
                    .resizable()
            } else {
                placeHolder
                    .animation(animation, value: flag)
                    .task {
                        flag = true
                    }
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .task {
            guard
                let source = source,
                let url = URL(string: source)
            else { return }
            do {
                showingImage = try await URLCachedImageProvider.shared.loadImage(from: url)
            } catch {
                Logger.event(message: error.localizedDescription)
            }
        }
        
    }
    
    private var placeHolder: some View {
        flag ? Color.gray : Color.gray.opacity(0.3)
    }
    
}

class UISkeletonLoadingImageView: UIView {
    
    private var hostingView: UIHostingController<SkeletonLoadingImage>!
    private var source: String?
    
    init(source: String?) {
        self.source = source
        super.init(frame: .zero)
        layout()
    }
    
    private func layout() {
        let view = SkeletonLoadingImage(source: source)
        self.hostingView = UIHostingController(rootView: view)
        addSubview(hostingView.view)
        hostingView.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func modifySource(_ source: String?) {
        self.source = source
        hostingView.rootView = SkeletonLoadingImage(source: source)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
