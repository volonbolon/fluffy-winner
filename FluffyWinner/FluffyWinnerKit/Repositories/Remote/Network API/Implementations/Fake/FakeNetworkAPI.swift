//
//  FakeNetworkAPI.swift
//  FluffyWinnerKit
//
//  Created by Ariel Rodriguez on 27/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation

public struct FakeNetworkAPI: NetworkAPI {
    public init() {}

    public func getSchools(completionHandler: @escaping GetSchoolsCompletionHandler) {
        let schools = self.schools
        let result = Either<NetworkAPIError, [School]>.Right(schools)
        let deadline = DispatchTime.now() + 0.5
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            completionHandler(result)
        }
    }
}

extension FakeNetworkAPI {
    private func getShoolsData() -> Data? {
        var data: Data? = nil
        if let bundle = Bundle(identifier: "Volonbolon.FluffyWinnerKit"),
            let url = bundle.url(forResource: "schools", withExtension: "json") {
            do {
                data = try Data(contentsOf: url)
            } catch {
                print(error)
            }
        }
        return data
    }

    fileprivate var schools: [School] {
        var schools: [School] = []
        if let data = self.getShoolsData() {
            do {
                let jsonDecoder = JSONDecoder()
                schools = try jsonDecoder.decode([School].self, from: data)
            } catch {
                print(error)
            }
        }
        return schools
    }
}
