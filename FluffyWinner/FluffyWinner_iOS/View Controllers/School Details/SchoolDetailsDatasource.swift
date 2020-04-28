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
    let satObservable: Observable<Sat?>
    let viewModel: SchoolDetailsViewModel

    public init(infoCellIndentifier: String,
                  satCellIdentifier: String,
                  satObservable: Observable<Sat?>,
                  viewModel: SchoolDetailsViewModel) {
        self.infoCellIndentifier = infoCellIndentifier
        self.satCellIdentifier = satCellIdentifier
        self.satObservable = satObservable
        self.viewModel = viewModel

        super.init()
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.schoolDigest.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = self.viewModel.schoolDigest[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: self.infoCellIndentifier, for: indexPath)
        cell.textLabel?.text = info
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}
