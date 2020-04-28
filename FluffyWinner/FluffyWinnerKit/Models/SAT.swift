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
    public let numOfSatTestTakers: Int
    public let satCriticalReadingAvgScore: Int
    public let satMathAvgScore: Int
    public let satWritingAvgScore: Int

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: CodingKeys.id)
        self.name = try container.decode(String.self, forKey: CodingKeys.name)

        // numOfSatTestTakers
        let numOfSatTestTakersString = try container.decode(String.self,
                                                            forKey: CodingKeys.numOfSatTestTakers)
        guard let numOfSatTestTakers = Int(numOfSatTestTakersString) else {
            let context = DecodingError.Context(codingPath: container.codingPath + [CodingKeys.numOfSatTestTakers],
                                                debugDescription: "Could not parse json key to a Int object")
            throw DecodingError.dataCorrupted(context)
        }
        self.numOfSatTestTakers = numOfSatTestTakers

        // satCriticalReadingAvgScore
        let satCriticalReadingAvgScoreString = try container.decode(String.self,
                                                                    forKey: CodingKeys.satCriticalReadingAvgScore)
        guard let satCriticalReadingAvgScore = Int(satCriticalReadingAvgScoreString) else {
            let context = DecodingError.Context(codingPath: container.codingPath + [CodingKeys.satCriticalReadingAvgScore],
                                                debugDescription: "Could not parse json key to a Int object")
            throw DecodingError.dataCorrupted(context)
        }
        self.satCriticalReadingAvgScore = satCriticalReadingAvgScore

        // satMathAvgScore
        let satMathAvgScoreString = try container.decode(String.self,
                                                         forKey: CodingKeys.satMathAvgScore)
        guard let satMathAvgScore = Int(satMathAvgScoreString) else {
            let context = DecodingError.Context(codingPath: container.codingPath + [CodingKeys.satMathAvgScore],
                                                debugDescription: "Could not parse json key to a Int object")
            throw DecodingError.dataCorrupted(context)
        }
        self.satMathAvgScore = satMathAvgScore

        // satWritingAvgScore
        let satWritingAvgScoreString = try container.decode(String.self,
                                                            forKey: CodingKeys.satWritingAvgScore)
        guard let satWritingAvgScore = Int(satWritingAvgScoreString) else {
            let context = DecodingError.Context(codingPath: container.codingPath + [CodingKeys.satWritingAvgScore],
                                                debugDescription: "Could not parse json key to a Int object")
            throw DecodingError.dataCorrupted(context)
        }
        self.satWritingAvgScore = satWritingAvgScore
    }

    enum CodingKeys: String, CodingKey {
        case id = "dbn"
        case name = "school_name"
        case numOfSatTestTakers = "num_of_sat_test_takers"
        case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case satMathAvgScore = "sat_math_avg_score"
        case satWritingAvgScore = "sat_writing_avg_score"
    }
}

extension Sat: CustomStringConvertible {
    public var description: String {
        return "\(self.name)"
    }
}
