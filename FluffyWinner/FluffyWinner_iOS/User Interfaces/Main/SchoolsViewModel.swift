//
//  SchoolsViewModel.swift
//  FluffyWinner_iOS
//
//  Created by Ariel Rodriguez on 27/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation
import FluffyWinnerKit

public class SchoolsViewModel: NSObject {
    weak var uxResponder: SchoolsUXResponder?
    weak var observable: Observable<[School]>?

    init(observable: Observable<[School]>) {
        self.observable = observable
    }
}
