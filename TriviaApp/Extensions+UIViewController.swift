//
//  Extensions+UIViewController.swift
//  Trivia
//
//  Created by Rudresh Uppin on 15/09/20.
//  Copyright © 2020 Rudresh Uppin. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    
     func showAlert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
