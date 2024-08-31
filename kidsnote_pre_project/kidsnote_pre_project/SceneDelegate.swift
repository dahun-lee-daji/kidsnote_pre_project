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
    var store: StoreOf<AppRoot>!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        self.store = StoreOf<AppRoot>(initialState: AppRoot.State()) {
            AppRoot()
        }
        
        self.window = UIWindow(windowScene: scene)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = createNavigationController()
    }
    
    private func createNavigationController() -> UINavigationController {
        let rootView = BookSearchView(
            store: store.scope(
                state: \.bookSearch,
                action: \.bookSearch
            )
        )
        let bookSearchViewHostingController = UIHostingController(rootView: rootView)
        return UINavigationController(rootViewController: bookSearchViewHostingController)
    }
    
}
