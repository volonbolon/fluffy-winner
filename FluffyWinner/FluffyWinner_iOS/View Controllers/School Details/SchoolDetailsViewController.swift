//
//  SchoolDetailsViewController.swift
//  FluffyWinner_iOS
//
//  Created by Ariel Rodriguez on 27/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import UIKit
import FluffyWinnerUIKit
import FluffyWinnerKit
import SafariServices

public class SchoolDetailsViewController: NiblessViewController {
    let school: School
    let userInterface: SchoolDetailsView

    init(school: School, userInterface: SchoolDetailsView) {
        self.school = school
        self.userInterface = userInterface

        super.init()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action,
                                                                 target: self,
                                                                 action: .showWeb)
    }

    public override func loadView() {
        self.view = self.userInterface
    }
}

extension SchoolDetailsViewController { // MARK: Actions
    @IBAction func showWeb() {
        let website = self.school.website
        var components = URLComponents()
        components.scheme = "https"
        components.host = website

        if let url = components.url {
            let viewController = SFSafariViewController(url: url)
            self.navigationController?.present(viewController, animated: true, completion: nil)
        }
    }
}

fileprivate extension Selector {
    static let showWeb = #selector(SchoolDetailsViewController.showWeb)
}
