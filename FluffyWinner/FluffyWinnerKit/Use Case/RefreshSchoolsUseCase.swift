//
//  RefreshSchoolsUseCase.swift
//  FluffyWinnerKit
//
//  Created by Ariel Rodriguez on 27/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation

public class RefreshSchoolsUseCase: UseCase {
    let remoteAPI: NetworkAPI
    let observable: Observable<[School]>

    public init(remoteAPI: NetworkAPI,
                observable: Observable<[School]>) {
        self.remoteAPI = remoteAPI
        self.observable = observable
    }

    public func start() {
        self.remoteAPI.getSchools { result in
            switch result {
            case .Left(let error):
                print(error)
            case .Right(let networks):
                self.observable.value = networks
            }
        }
    }
}

public protocol RefreshSchoolsUseCaseFactory {
    func makeRefreshSchoolsUseCase(observable: Observable<[School]>) -> UseCase
}
