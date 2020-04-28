//
//  ViewController+ErrorPresentation.swift
//  FluffyWinnerUIKit
//
//  Created by Ariel Rodriguez on 28/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import UIKit
import FluffyWinnerKit

extension UIViewController {
    public func present(errorMessage: ErrorMessage) {
        let alertController = UIAlertController(title: errorMessage.title,
                                                message: errorMessage.message,
                                                preferredStyle: .alert)
        let okTitle = NSLocalizedString("OK", comment: "OK")
        let okAction = UIAlertAction(title: okTitle, style: .default)
        alertController.addAction(okAction)
        self.present(alertController,
                     animated: true,
                     completion: nil)
    }
}
