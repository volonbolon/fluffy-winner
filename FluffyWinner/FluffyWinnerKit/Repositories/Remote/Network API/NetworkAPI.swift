//
//  NetworkAPI.swift
//  FluffyWinnerKit
//
//  Created by Ariel Rodriguez on 27/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation

public enum NetworkAPIError: Error {
    case connectionError
    case parsingError
}

public typealias GetSchoolsCompletionHandler = (Either<NetworkAPIError, [School]>) -> Void
public typealias GetSATsCompletionHandler = (Either<NetworkAPIError, Sat>) -> Void

public protocol NetworkAPI {
    func getSchools(completionHandler: @escaping GetSchoolsCompletionHandler)
    func getSATs(school: School,
                 completionHandler: @escaping GetSATsCompletionHandler)
}
