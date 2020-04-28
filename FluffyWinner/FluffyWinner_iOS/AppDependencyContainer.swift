//
//  AppDependencyContainer.swift
//  FluffyWinner_iOS
//
//  Created by Ariel Rodriguez on 27/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import UIKit
import FluffyWinnerKit

public struct AppDependencyContainer {
    public init() {}

    private var remoteAPI: NetworkAPI {
        return FakeNetworkAPI()
    }

    public func makeRootViewController() -> RootViewController {
        let schoolsViewController = self.makeSchoolsViewController()
        let viewController = RootViewController(schoolsViewController: schoolsViewController)

        return viewController
    }

    public func makeSchoolsViewController() -> SchoolsViewController {
        let observable = Observable<[School]>([])
        let viewModel = SchoolsViewModel(observable: observable)
        let userInterface = SchoolsRootView(viewModel: viewModel)
        let viewController = SchoolsViewController(userInterface: userInterface,
                                                   refreshSchoolsFactory: self,
                                                   observable: observable,
                                                   showSchoolDetailsFactory: self.makeSchoolDetailViewController)
        viewModel.uxResponder = viewController
        return viewController
    }

    public func makeSchoolDetailViewController(school: School) -> SchoolDetailsViewController {
        let observable = Observable<Sat?>(nil)
        let viewModel = SchoolDetailsViewModel(school: school)
        let datasource = SchoolDetailsDatasource(infoCellIndentifier: SchoolDetailsView.SchoolDetailsInfoCellIndentifier,
                                                 satCellIdentifier: SchoolDetailsView.SchoolDetailsSatCellIndentifier,
                                                 satObservable: observable,
                                                 viewModel: viewModel)
        let userInterface = SchoolDetailsView(datasource: datasource, viewModel: viewModel)
        let viewController = SchoolDetailsViewController(school: school,
                                                         userInterface: userInterface)

        return viewController
    }
}

extension AppDependencyContainer: RefreshSchoolsUseCaseFactory {
    public func makeRefreshSchoolsUseCase(observable: Observable<[School]>) -> UseCase {
        let useCase = RefreshSchoolsUseCase(remoteAPI: self.remoteAPI, observable: observable)
        return useCase
    }
}
