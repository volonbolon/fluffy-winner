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
    let observable: Observable<Sat?>
    let userInterface: SchoolDetailsView
    let retrieveSatUseCaseFactory: RetrieveSATsUseCaseFactory

    init(school: School,
         userInterface: SchoolDetailsView,
         observable: Observable<Sat?>,
         retrieveSatUseCaseFactory: RetrieveSATsUseCaseFactory) {
        self.school = school
        self.observable = observable
        self.retrieveSatUseCaseFactory = retrieveSatUseCaseFactory
        self.userInterface = userInterface

        super.init()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action,
                                                                 target: self,
                                                                 action: .showWeb)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        let useCase = self.retrieveSatUseCaseFactory.makeRetrieveSATsUseCase(school: self.school,
                                                                             observable: self.observable)
        useCase.start()
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
        } else {
            let errorTitle = NSLocalizedString("Wrong URL", comment: "Wrong URL")
            let errorTxt = NSLocalizedString("Unable to compose a URL",
                                             comment: "Unable to compose a URL")
            let errorMessage = ErrorMessage(title: errorTitle, message: errorTxt)
            self.present(errorMessage: errorMessage)
        }
    }
}

fileprivate extension Selector {
    static let showWeb = #selector(SchoolDetailsViewController.showWeb)
}
