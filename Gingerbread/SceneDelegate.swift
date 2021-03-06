//
//  SceneDelegate.swift
//  Gingerbread
//
//  Created by Анна Сычева on 28.09.2020.
//  Copyright © 2020 Анна Сычева. All rights reserved.
//

import UIKit

// MARK: - SceneDelegate

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Public properties
    
    var window: UIWindow?
    
    // MARK: - Private properties
    
    private lazy var navigationController = UINavigationController()

    // MARK: - Public methods
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let coordinator = Coordinator(navigationController: navigationController)
        coordinator.start()
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
    }

}
