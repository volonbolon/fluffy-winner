//
//  SAT.swift
//  FluffyWinnerKit
//
//  Created by Ariel Rodriguez on 27/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation

public struct Sat: Equatable, Codable {
    public let id: String
    public let name: String
    public let numOfSatTestTakers: String
    private let rawSatCriticalReadingAvgScore: String
    private let rawSatMathAvgScore: String
    private let rawSatWritingAvgScore: String

    public var satCriticalReadingAvgScore: Int? {
        guard let criticalReadingAvgScore = Int(self.rawSatCriticalReadingAvgScore) else {
            return nil
        }

        return criticalReadingAvgScore
    }

    public var satMathAvgScore: Int? {
        guard let criticalReadingAvgScore = Int(self.rawSatMathAvgScore) else {
            return nil
        }

        return criticalReadingAvgScore
    }

    public var satWritingAvgScore: Int? {
        guard let criticalReadingAvgScore = Int(self.rawSatWritingAvgScore) else {
            return nil
        }

        return criticalReadingAvgScore
    }

    enum CodingKeys: String, CodingKey {
        case id = "dbn"
        case name = "school_name"
        case numOfSatTestTakers = "num_of_sat_test_takers"
        case rawSatCriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case rawSatMathAvgScore = "sat_math_avg_score"
        case rawSatWritingAvgScore = "sat_writing_avg_score"
    }
}

extension Sat: CustomStringConvertible {
    public var description: String {
        return "\(self.name)"
    }
}
