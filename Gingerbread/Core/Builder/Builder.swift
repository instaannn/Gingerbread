//
//  Builder.swift
//  Gingerbread
//
//  Created by Анна Сычева on 28.09.2020.
//  Copyright © 2020 Анна Сычева. All rights reserved.
//

// MARK: - Builder

final class Builder: IBuilder {
    
    // MARK: - Public methods
    
    static func makeMainViewController(coordinator: IMainCoordinator) -> MainViewController {
        let viewController = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: viewController, coordinator: coordinator, networkService: networkService)
        
        viewController.presenter = presenter
        
        return viewController
    }
    
}
