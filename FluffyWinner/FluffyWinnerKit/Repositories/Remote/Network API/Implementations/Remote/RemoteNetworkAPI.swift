//
//  RemoteNetworkAPI.swift
//  FluffyWinnerKit
//
//  Created by Ariel Rodriguez on 28/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation

public struct RemoteNetworkAPI: NetworkAPI {
    public init() {}

    fileprivate func parseSchoolsData(_ data: Data, completionHandler: @escaping GetSchoolsCompletionHandler) {
        do {
            let jsonDecoder = JSONDecoder()
            let throwables = try jsonDecoder.decode([Throwable<School>].self, from: data)
            let schools = throwables.compactMap { try? $0.result.get() }
            let result = Either<NetworkAPIError, [School]>.Right(schools)
            DispatchQueue.main.async {
                completionHandler(result)
            }
        } catch {
            let parsingError = NetworkAPIError.parsingError
            let result = Either<NetworkAPIError, [School]>.Left(parsingError)
            DispatchQueue.main.async {
                completionHandler(result)
            }
        }
    }

    public func getSchools(completionHandler: @escaping GetSchoolsCompletionHandler) {
        func closureWithError(_ error: NetworkAPIError, completionHandler: @escaping GetSchoolsCompletionHandler) {
            let result = Either<NetworkAPIError, [School]>.Left(error)
            DispatchQueue.main.async {
                completionHandler(result)
            }
        }

        let sessionConfig = URLSessionConfiguration.default

        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)

        guard let URL = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json") else {
            return
        }
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"

        request.addValue("2Bc7XcpsrWm459DzzHbCHLBkq", forHTTPHeaderField: "X-App-Token")

        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                guard let httpResponse = response as? HTTPURLResponse else {
                    let error = NetworkAPIError.connectionError
                    closureWithError(error, completionHandler: completionHandler)
                  return
                }
                guard 200..<300 ~= httpResponse.statusCode else {
                    let error = NetworkAPIError.connectionError
                    closureWithError(error, completionHandler: completionHandler)
                    return
                }

                if let data = data {
                    self.parseSchoolsData(data, completionHandler: completionHandler)
                } else {
                    let error = NetworkAPIError.parsingError
                    closureWithError(error, completionHandler: completionHandler)
                }
            } else {
                let error = NetworkAPIError.unknown
                closureWithError(error, completionHandler: completionHandler)
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }

    public func getSATs(school: School, completionHandler: @escaping GetSATsCompletionHandler) {

    }
}



