//
//  ICoordinator.swift
//  pryanikyMvc
//
//  Created by Анна Сычева on 26.09.2020.
//  Copyright © 2020 Анна Сычева. All rights reserved.
//

import UIKit

// MARK: - ICoordinator

protocol ICoordinator {
    var navigationController: UINavigationController { get }
    func start()
}
