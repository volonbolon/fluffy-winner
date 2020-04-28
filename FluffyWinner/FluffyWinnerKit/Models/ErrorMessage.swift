//
//  ErrorMessage.swift
//  FluffyWinnerKit
//
//  Created by Ariel Rodriguez on 28/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation

public struct ErrorMessage: Error, Hashable {
    public let id: UUID
    public let title: String
    public let message: String

    public init(title: String, message: String) {
        self.title = title
        self.message = message
        self.id = UUID()
    }
}
