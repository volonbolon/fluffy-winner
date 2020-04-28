//
//  RetrieveSATsUseCase.swift
//  FluffyWinnerKit
//
//  Created by Ariel Rodriguez on 28/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation

public class RetrieveSATsUseCase: UseCase {
    let remoteAPI: NetworkAPI
    let school: School
    let observable: Observable<Sat?>

    public init(remoteAPI: NetworkAPI,
                school: School,
                observable: Observable<Sat?>) {
        self.remoteAPI = remoteAPI
        self.observable = observable
        self.school = school
    }

    public func start() {
        self.remoteAPI.getSATs(school: self.school) { result in
            switch result {
            case .Left(let error):
                print(error)
            case .Right(let sat):
                self.observable.value = sat
            }
        }
    }
}

public protocol RetrieveSATsUseCaseFactory {
    func makeRetrieveSATsUseCase(school: School,
                                 observable: Observable<Sat?>) -> UseCase
}
