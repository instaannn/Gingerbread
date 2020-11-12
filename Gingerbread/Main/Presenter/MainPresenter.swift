//
//  MainPresenter.swift
//  Gingerbread
//
//  Created by Анна Сычева on 28.09.2020.
//  Copyright © 2020 Анна Сычева. All rights reserved.
//

import Foundation

//MARK: - MainPresenter

final class MainPresenter {
    
    // MARK: - Public properties
    
    weak var view: IMainViewController?
    var variants: [Variants]?
    
    // MARK: - Private properties
    
    private var views: MainData?
    private let coordinator: IMainCoordinator
    private let networkService: INetworkService
    
    // MARK: - Init
    
    init(view: IMainViewController?, coordinator: IMainCoordinator, networkService: INetworkService) {
        self.view = view
        self.coordinator = coordinator
        self.networkService = networkService
    }
    
    // MARK: - Public methods
    
    func fetchData() {
        networkService.fetchMainData { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .failure(_):
                    self.view?.failure()
                case.success(let data):                    
                    guard
                        let dataView = data.view,
                        let dataText = data.data?[Constants.indexZero].data?.text,
                        let dataTextTwo = data.data?[Constants.indexOne].data?.text,
                        let url = data.data?[Constants.indexOne].data?.url else { return }
                    
                    self.view?.getViews(dataViews: dataView)
                    self.view?.getHZ(text: dataText)
                    self.view?.getPicture(text: dataTextTwo, nameImage: url)
                    self.variants = data.data?[Constants.indexTwo].data?.variants
                    self.view?.succes()
                }
            }
        }
    }
}

//MARK: - IMainPresenter

extension MainPresenter: IMainPresenter {}

//MARK: - Constants

private extension MainPresenter {
    
    enum Constants {
        static let indexZero: Int = 0
        static let indexOne: Int = 1
        static let indexTwo: Int = 2
    }
    
}
