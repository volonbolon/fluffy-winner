//
//  Observable.swift
//  FluffyWinnerKit
//
//  Created by Ariel Rodriguez on 27/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation

public class Observable<Type> {
    public typealias Observer = (Type) -> Void
    public typealias Token = NSObjectProtocol

    private var observers: [(Token, Observer)] = []

    public var value: Type {
        didSet {
            self.notify()
        }
    }

    public init(_ value: Type) {
        self.value = value
    }

    @discardableResult public func bind(_ observer: @escaping Observer) -> Token {
        defer {
            observer(self.value)
        }
        let obj = NSObject()
        let tuple = (obj, observer)
        observers.append(tuple)
        return obj
    }

    public func unbind(_ token: Token) {
        self.observers.removeAll { (tuple) -> Bool in
            tuple.0.isEqual(token)
        }
    }

    private func notify() {
        observers.forEach { (tuple) in
            tuple.1(self.value)
        }
    }
}
