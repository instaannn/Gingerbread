//
//  NetworkService.swift
//  Gingerbread
//
//  Created by Анна Сычева on 28.09.2020.
//  Copyright © 2020 Анна Сычева. All rights reserved.
//

import Foundation

// MARK: - NetworkService

final class NetworkService: INetworkService {
    
    // MARK: - Public methods
    
    func fetchMainData(completion: @escaping(Result<MainData, Error>) -> Void) {
        downloadJson(url: ApiURL.pryanikyApi, complition: completion)
    }
    
    // MARK: - Private methods

    private func downloadJson<T: Decodable>(url: String, complition: @escaping(Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, _, error) in
            if let error = error {
                complition(.failure(error))
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                complition(.success(object))
                print(data)
            } catch {
                complition(.failure(error))
            }
        }.resume()
    }
    
}
