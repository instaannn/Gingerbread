//
//  MainModel.swift
//  Gingerbread
//
//  Created by Анна Сычева on 28.09.2020.
//  Copyright © 2020 Анна Сычева. All rights reserved.
//

// MARK: - MainData

struct MainData: Decodable {
    var data: [NameData]?
    var view: [String]?
}

// MARK: - Data

struct NameData: Decodable {
    var name: String?
    var data: DetailData?
}

// MARK: - DetailData

struct DetailData: Decodable {
    var url: String?
    var text: String?
    var selectedId: Int?
    var variants: [Variants]?
}

// MARK: - Variants

struct Variants: Decodable {
    var id: Int?
    var text: String?
}
