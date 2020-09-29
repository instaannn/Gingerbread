//
//  IMainPresenter.swift
//  Gingerbread
//
//  Created by Анна Сычева on 28.09.2020.
//  Copyright © 2020 Анна Сычева. All rights reserved.
//

//MARK: - IMainPresenter

protocol IMainPresenter {
    var variants: [Variants]? { get }
    func fetchData()
}
