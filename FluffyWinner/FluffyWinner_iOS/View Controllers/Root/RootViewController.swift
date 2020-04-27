//
//  RootViewController.swift
//  FluffyWinner_iOS
//
//  Created by Ariel Rodriguez on 27/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import UIKit
import FluffyWinnerUIKit

public class RootViewController: NiblessNavigationController {
    let schoolsViewController: SchoolsViewController

    init(schoolsViewController: SchoolsViewController) {
        self.schoolsViewController = schoolsViewController

        super.init()
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        self.pushViewController(self.schoolsViewController,
                                animated: false)
    }
}
