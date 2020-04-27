//
//  SchoolsViewController.swift
//  FluffyWinner_iOS
//
//  Created by Ariel Rodriguez on 27/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import UIKit
import FluffyWinnerUIKit

public class SchoolsViewController: NiblessViewController {
    let userInterface: SchoolsRootView
    
    public init(userInterface: SchoolsRootView) {
        self.userInterface = userInterface

        super.init()
    }

    public override func loadView() {
        super.loadView()

        self.view = self.userInterface
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.userInterface.setRegion(latitude: 40.7128,
                                     longitude: -73.97105,
                                     span: 10_000)
    }
}
