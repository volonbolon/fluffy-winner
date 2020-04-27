//
//  NiblessTableView.swift
//  FluffyWinnerUIKit
//
//  Created by Ariel Rodriguez on 27/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import UIKit

open class NiblessTableView: UITableView {
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }

    @available(*, unavailable,
    message: "Loading this table view from a nib is unsupported in favor of initializer dependency injection."
    )
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Loading this table view from a nib is unsupported in favor of initializer dependency injection.")
    }
}

