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

    public func getSATs(school: School,
                        completionHandler: @escaping GetSATsCompletionHandler) {
        var result: Either<NetworkAPIError, Sat>!
        if let sat = self.produceTestSat() {
            result = Either<NetworkAPIError, Sat>.Right(sat)
        } else {
            let error = NetworkAPIError.parsingError
            result = Either<NetworkAPIError, Sat>.Left(error)
        }
        let deadline = DispatchTime.now() + 0.5
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            completionHandler(result)
        }
    }
}

extension FakeNetworkAPI {
    private func satData() -> Data? {
        let json = """
        [
            {
                "dbn": "21K728",
                "school_name": "LIBERATION DIPLOMA PLUS",
                "num_of_sat_test_takers": "10",
                "sat_critical_reading_avg_score": "411",
                "sat_math_avg_score": "369",
                "sat_writing_avg_score": "373"
            }
        ]
        """
        let data = json.data(using: .utf8)
        return data
    }

    fileprivate func produceTestSat() -> Sat? {
        guard let data = satData() else {
            return nil
        }
        do {
            let decoder = JSONDecoder()
            let satArray = try decoder.decode([Sat].self, from: data)
            return satArray.first
        } catch {
            print(error)
        }
        return nil
    }

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
