//
//  MainTableViewCell.swift
//  Gingerbread
//
//  Created by Анна Сычева on 29.09.2020.
//  Copyright © 2020 Анна Сычева. All rights reserved.
//

import UIKit

// MARK: - MainTableViewCell

final class MainTableViewCell: UITableViewCell {
    
    // MARK: Private properties
    
    private lazy var idLabel = UILabel()
    private lazy var textNameLabel = UILabel()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public methods
    
    func setupDataCell(id: Int?, text: String?) {
        idLabel.text = "\(id ?? Constants.zero)"
        textNameLabel.text = text
    }
}

// MARK: - Setup

private extension MainTableViewCell {
    
    func setupCell() {
        
        addCell()
    
        layout()
    }
}

// MARK: - Setup Cell

private extension MainTableViewCell {
    
    func addCell() {
        contentView.addSubview(idLabel)
        contentView.addSubview(textNameLabel)
    }
}

// MARK: - Layout

private extension MainTableViewCell {
    
    func layout() {
        
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.topAnchor),
            idLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.leadingAnchor),
            idLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: Constants.bottomAnchor)])
        
        textNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textNameLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.topAnchor),
            textNameLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constants.trailingAnchor),
            textNameLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: Constants.bottomAnchor)])
    }
}

// MARK: - Constants

private extension MainTableViewCell {
    
    enum Constants {
        static let topAnchor: CGFloat = 10
        static let leadingAnchor: CGFloat = 20
        static let trailingAnchor: CGFloat = -20
        static let bottomAnchor: CGFloat = -10
        static let zero: Int = 0
    }
    
}
