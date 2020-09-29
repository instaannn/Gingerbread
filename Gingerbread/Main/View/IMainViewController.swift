//
//  IMainViewController.swift
//  Gingerbread
//
//  Created by Анна Сычева on 28.09.2020.
//  Copyright © 2020 Анна Сычева. All rights reserved.
//

import Foundation

// MARK: - IMainViewController

protocol IMainViewController: class {
    func succes()
    func failure()
    
    func getViews(dataViews: [String])
    func getHZ(text: String)
    func getPicture(text: String, nameImage: String)
}
