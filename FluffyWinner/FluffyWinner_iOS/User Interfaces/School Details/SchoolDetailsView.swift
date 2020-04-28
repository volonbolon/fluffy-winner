//
//  SchoolDetailsView.swift
//  FluffyWinner_iOS
//
//  Created by Ariel Rodriguez on 27/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import UIKit
import FluffyWinnerUIKit

class SchoolDetailsView: NiblessTableView {
    static let SchoolDetailsInfoCellIndentifier = "SchoolDetailsInfoCellIndentifier"
    static let SchoolDetailsSatCellIndentifier = "SchoolDetailsSatCellIndentifier"

    let schoolDetailsDatasource: UITableViewDataSource
    let viewModel: SchoolDetailsViewModel

    init(datasource: UITableViewDataSource,
         viewModel: SchoolDetailsViewModel) {
        self.schoolDetailsDatasource = datasource
        self.viewModel = viewModel

        super.init(frame: .zero, style: .grouped)

        self.register(UITableViewCell.self,
                      forCellReuseIdentifier: SchoolDetailsView.SchoolDetailsInfoCellIndentifier)

        self.dataSource = datasource
    }
    
    public override func didMoveToWindow() {
        super.didMoveToWindow()


    }
}
