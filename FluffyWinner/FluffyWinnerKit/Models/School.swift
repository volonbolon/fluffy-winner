//
//  School.swift
//  FluffyWinnerKit
//
//  Created by Ariel Rodriguez on 27/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation
import CoreLocation

public struct School: Equatable, Codable {
    public let id: String
    public let name: String
    public let overviewParagraph: String
    private let latitude: String
    private let longitude: String
    public let location: String
    public let website: String

    public var coordinate: CLLocationCoordinate2D? {
        guard let lat = Double(self.latitude),
            let lng = Double(self.longitude) else {
            return nil
        }
        let coordinate = CLLocationCoordinate2D(latitude: lat,
                                                longitude: lng)

        return coordinate
    }

    enum CodingKeys: String, CodingKey {
        case id = "dbn"
        case name = "school_name"
        case overviewParagraph = "overview_paragraph"
        case latitude
        case longitude
        case location
        case website
    }
}

extension School: CustomStringConvertible {
    public var description: String {
        return "\(self.name)"
    }
}
