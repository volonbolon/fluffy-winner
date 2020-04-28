//
//  SchoolsViewController.swift
//  FluffyWinner_iOS
//
//  Created by Ariel Rodriguez on 27/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import UIKit
import FluffyWinnerUIKit
import FluffyWinnerKit

public class SchoolsViewController: NiblessViewController {
    let userInterface: SchoolsRootView
    let refreshSchoolsFactory: RefreshSchoolsUseCaseFactory
    let observable: Observable<[School]>
    let showSchoolDetailsFactory: (School) -> SchoolDetailsViewController

    public init(userInterface: SchoolsRootView,
                refreshSchoolsFactory: RefreshSchoolsUseCaseFactory,
                observable: Observable<[School]>,
                showSchoolDetailsFactory: @escaping (School) -> SchoolDetailsViewController) {
        self.userInterface = userInterface
        self.observable = observable
        self.refreshSchoolsFactory = refreshSchoolsFactory
        self.showSchoolDetailsFactory = showSchoolDetailsFactory

        super.init()
    }

    public override func loadView() {
        super.loadView()

        self.view = self.userInterface
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.title = NSLocalizedString("Schools", comment: "Schools")

        self.userInterface.setRegion(latitude: 40.7128,
                                     longitude: -73.97105,
                                     span: 10_000)
    }
}

extension SchoolsViewController: SchoolsUXResponder {
    func refreshSchools() {
        let factory = self.refreshSchoolsFactory
        let useCase = factory.makeRefreshSchoolsUseCase(observable: self.observable)
        useCase.start()
    }

    func showSchoolDetails(school: School) {
        let viewController = self.showSchoolDetailsFactory(school)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
