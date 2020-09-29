//
//  MainCollectionViewCell.swift
//  Gingerbread
//
//  Created by Анна Сычева on 28.09.2020.
//  Copyright © 2020 Анна Сычева. All rights reserved.
//

import UIKit

// MARK: - MainCollectionViewCell

final class MainCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Private properties
    
    private lazy var label = UILabel()
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    func setupDataCell(data: String) {
        label.text = data
    }
}

// MARK: - Setup

private extension MainCollectionViewCell {
    
    func setupCell() {
        addCell()
        setupLabel()
        
        layout()
    }
}

// MARK: - Setup Cell

private extension MainCollectionViewCell {
    
    func addCell() {
        contentView.addSubview(label)
    }
    
    func setupLabel() {
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.italicSystemFont(ofSize: Constants.fontSize)
    }
}

// MARK: - Layout

private extension MainCollectionViewCell {
    
    func layout() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(
                equalTo: contentView.centerYAnchor)])
    }
}

// MARK: - Constants


private extension MainCollectionViewCell {
    
    enum Constants {
        static let fontSize: CGFloat = 15
    }
}
