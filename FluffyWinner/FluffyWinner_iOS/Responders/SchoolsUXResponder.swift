//
//  SchoolsUXResponder.swift
//  FluffyWinner_iOS
//
//  Created by Ariel Rodriguez on 27/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation
import FluffyWinnerKit

protocol SchoolsUXResponder: class {
    var observable: Observable<[School]> { get }
    func refreshSchools()
}
