//
//  INetworkService.swift
//  Gingerbread
//
//  Created by Анна Сычева on 28.09.2020.
//  Copyright © 2020 Анна Сычева. All rights reserved.
//

import Foundation

// MARK: - INetworkService

protocol INetworkService {
    func fetchMainData(completion: @escaping(Result<MainData, Error>) -> Void)
}
