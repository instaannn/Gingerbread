//
//  IBuilder.swift
//  Gingerbread
//
//  Created by Анна Сычева on 28.09.2020.
//  Copyright © 2020 Анна Сычева. All rights reserved.
//

// MARK: - IBuilder

protocol IBuilder {
    static func makeMainViewController(coordinator: IMainCoordinator) -> MainViewController
}
