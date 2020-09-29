//
//  UIViewController+UIAlertController.swift
//  Gingerbread
//
//  Created by Анна Сычева on 29.09.2020.
//  Copyright © 2020 Анна Сычева. All rights reserved.
//

import UIKit

// MARK: - UIViewController+UIAlertController

extension UIViewController {
    
    // MARK: Public methods
    
    func presentAlert(withTitle title: String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: Constants.title, style: .default)
        alertController.addAction(OKAction)
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: - Constants

private extension UIViewController {
    enum Constants {
        static let title: String = "Повторить запрос"
    }
    
}
