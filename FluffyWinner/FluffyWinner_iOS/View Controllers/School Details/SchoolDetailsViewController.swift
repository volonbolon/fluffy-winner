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

public class SchoolDetailsViewController: NiblessViewController {
    let school: School
    let userInterface: SchoolDetailsView

    init(school: School, userInterface: SchoolDetailsView) {
        self.school = school
        self.userInterface = userInterface

        super.init()
    }

    public override func loadView() {
        self.view = self.userInterface
    }
}
