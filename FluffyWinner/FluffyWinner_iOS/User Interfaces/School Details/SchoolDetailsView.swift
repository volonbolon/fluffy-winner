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
        self.register(SchoolDetailsSatCell.self,
                      forCellReuseIdentifier: SchoolDetailsView.SchoolDetailsSatCellIndentifier)
        self.rowHeight = UITableView.automaticDimension
        self.estimatedRowHeight = 44

        self.dataSource = datasource
    }
    
    public override func didMoveToWindow() {
        super.didMoveToWindow()

        self.bindViewModel()
    }
}

extension SchoolDetailsView { // MARK: - Helpers
    fileprivate func bindViewModel() {
        self.viewModel.observable.bind { sat in
            let satSection = IndexSet(integer: 1)
            if sat != nil {
                self.insertSections(satSection, with: .automatic)
            } else {
                if self.numberOfSections == 2 {
                    self.deleteSections(satSection, with: .automatic)
                }
            }
        }
    }
}
