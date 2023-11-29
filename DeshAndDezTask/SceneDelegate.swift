//
//  SceneDelegate.swift
//  DeshAndDezTask
//
//  Created by Ammar.M on 29/11/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        openCategoriesViewController(windowScene: windowScene)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
       
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }
}

extension SceneDelegate {
    func openCategoriesViewController(windowScene: UIWindowScene) {
        let viewController = UINavigationController(rootViewController: CategoriesViewController())
        viewController.isNavigationBarHidden = true
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = viewController
        self.window = window
        self.window?.overrideUserInterfaceStyle = .light
        window.makeKeyAndVisible()
    }
}
