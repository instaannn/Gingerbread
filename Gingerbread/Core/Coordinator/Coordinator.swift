//
//  Coordinator.swift
//  pryanikyMvc
//
//  Created by Анна Сычева on 26.09.2020.
//  Copyright © 2020 Анна Сычева. All rights reserved.
//

import UIKit

// MARK: - Coordinator

final class Coordinator: ICoordinator {
    
    // MARK: - Public properties
    
    var navigationController: UINavigationController
    
    // MARK: - Init

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Public methods
    
    func start() {
        goToViewMainViewController()
    }
    
    // MARK: - Private methods
    
    private func goToViewMainViewController() {
        let viewController = Builder.makeMainViewController(coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - IMainCoordinator

extension Coordinator: IMainCoordinator { }
