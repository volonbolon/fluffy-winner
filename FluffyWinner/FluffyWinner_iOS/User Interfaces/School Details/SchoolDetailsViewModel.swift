//
//  SchoolDetailsViewModel.swift
//  FluffyWinner_iOS
//
//  Created by Ariel Rodriguez on 27/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation
import FluffyWinnerKit

public struct SchoolDetailsViewModel {
    public let school: School
    public let schoolDigest: [String]
    public let observable: Observable<Sat?>

    init(school: School, observable: Observable<Sat?>) {
        self.school = school
        self.observable = observable

        let digest = [
            school.name,
            school.overviewParagraph,
            school.location
        ]
        self.schoolDigest = digest
    }
}
