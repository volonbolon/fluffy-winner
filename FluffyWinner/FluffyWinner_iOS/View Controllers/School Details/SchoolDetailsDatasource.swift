//
//  SchoolDetailsDatasource.swift
//  FluffyWinner_iOS
//
//  Created by Ariel Rodriguez on 27/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import UIKit
import FluffyWinnerKit

public class SchoolDetailsDatasource: NSObject, UITableViewDataSource {
    let infoCellIndentifier: String
    let satCellIdentifier: String
    let viewModel: SchoolDetailsViewModel

    public init(infoCellIndentifier: String,
                satCellIdentifier: String,
                viewModel: SchoolDetailsViewModel) {
        self.infoCellIndentifier = infoCellIndentifier
        self.satCellIdentifier = satCellIdentifier
        self.viewModel = viewModel

        super.init()
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        if self.viewModel.observable.value != nil {
            return 2
        }
        return 1
    }

    public func tableView(_ tableView: UITableView,
                          numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return self.viewModel.schoolDigest.count
        case 1:
            return 1
        default:
            return 0
        }
    }

    fileprivate func produceInfoCell(_ indexPath: IndexPath,
                                     _ tableView: UITableView) -> UITableViewCell {
        let info = self.viewModel.schoolDigest[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: self.infoCellIndentifier, for: indexPath)
        cell.textLabel?.text = info
        cell.textLabel?.numberOfLines = 0
        return cell
    }

    fileprivate func produceSatCell(_ indexPath: IndexPath,
                                     _ tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.satCellIdentifier,
                                                 for: indexPath)
        return cell
    }

    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return self.produceInfoCell(indexPath, tableView)
        case 1:
            return self.produceSatCell(indexPath, tableView)
        default:
            fatalError("We should have only two sections")
        }
    }
}
