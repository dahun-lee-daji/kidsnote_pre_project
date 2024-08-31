//
//  SceneDelegate.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 8/29/24.
//

import UIKit
import ComposableArchitecture
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: scene)
        self.window?.makeKeyAndVisible()
        let store = StoreOf<BookSearch>.init(initialState: .init()) {
            BookSearch()
        }
        let view = BookSearchView(store: store)
        let hosting = UIHostingController(rootView: view)
        self.window?.rootViewController = hosting
    }
    
}

