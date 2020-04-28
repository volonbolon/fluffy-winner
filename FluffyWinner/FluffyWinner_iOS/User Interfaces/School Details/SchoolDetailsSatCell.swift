//
//  SchoolDetailsSatCell.swift
//  FluffyWinner_iOS
//
//  Created by Ariel Rodriguez on 28/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import UIKit

class SchoolDetailsSatCell: UITableViewCell {
    private var hierarchyNotReady = true

    var numOfSatTestTakersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "numOfSatTestTakersLabel"
        return label
    }()

    var satCriticalReadingAvgScoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.text = NSLocalizedString("Critical Reading Avg Score",
                                       comment: "Critical Reading Avg Score")
        return label
    }()

    var satCriticalReadingAvgScoreBar: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.translatesAutoresizingMaskIntoConstraints = false

        return progress
    }()

    var satMathAvgScoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.text = NSLocalizedString("Math Avg Score",
                                       comment: "Math Avg Score")
        return label
    }()

    var satMathAvgScoreBar: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.translatesAutoresizingMaskIntoConstraints = false

        return progress
    }()

    var satWritingAvgScoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.text = NSLocalizedString("Writing Avg Score",
                                       comment: "Writing Avg Score")
        return label
    }()

    var satWritingAvgScoreBar: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.translatesAutoresizingMaskIntoConstraints = false

        return progress
    }()

    override func didMoveToWindow() {
        super.didMoveToWindow()

        guard self.hierarchyNotReady else {
            return
        }

        self.constructHierarchy()
        self.activateConstraints()

        self.backgroundColor = UIColor.white

        self.hierarchyNotReady = false
    }
}

extension SchoolDetailsSatCell { // MARK: - Actions
    private func normalise(score: Int) -> Float {
        return Float(score) / 800.0
    }

    public func setMathAvgScore(_ score: Int) {
        let normalised = self.normalise(score: score)
        self.satMathAvgScoreBar.progress = normalised
    }

    public func setCriticalReadingAvgScore(_ score: Int) {
        let normalised = self.normalise(score: score)
        self.satCriticalReadingAvgScoreBar.progress = normalised
    }

    public func setWritingAvgScore(_ score: Int) {
        let normalised = self.normalise(score: score)
        self.satWritingAvgScoreBar.progress = normalised
    }
}

extension SchoolDetailsSatCell { // MARK: - Helpers
    fileprivate func constructHierarchy() {
        self.contentView.addSubview(self.numOfSatTestTakersLabel)
        self.contentView.addSubview(self.satCriticalReadingAvgScoreLabel)
        self.contentView.addSubview(self.satCriticalReadingAvgScoreBar)
        self.contentView.addSubview(self.satMathAvgScoreLabel)
        self.contentView.addSubview(self.satMathAvgScoreBar)
        self.contentView.addSubview(self.satWritingAvgScoreLabel)
        self.contentView.addSubview(self.satWritingAvgScoreBar)
    }

    private func activateNumOfSatTestTakersLabelConstraints() {
        let topConstraint = self.numOfSatTestTakersLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10)
        topConstraint.priority = UILayoutPriority.defaultHigh
        let xConstraint = self.numOfSatTestTakersLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        let heightConstraint = self.numOfSatTestTakersLabel.heightAnchor.constraint(equalToConstant: 20)
        let toActivate = [
            topConstraint,
            xConstraint,
            heightConstraint
        ]
        NSLayoutConstraint.activate(toActivate)
    }

    private func activateSatCriticalReadingAvgScoreLabelConstraints() {
        let topConstraint = self.satCriticalReadingAvgScoreLabel.topAnchor.constraint(equalTo: self.numOfSatTestTakersLabel.bottomAnchor, constant: 10)
        let xConstraint = self.satCriticalReadingAvgScoreLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        let heightConstraint = self.satCriticalReadingAvgScoreLabel.heightAnchor.constraint(equalToConstant: 20)
        let toActivate = [
            topConstraint,
            xConstraint,
            heightConstraint
        ]
        NSLayoutConstraint.activate(toActivate)
    }

    private func activateSatCriticalReadingAvgScoreBarConstraints() {
        let topConstraint = self.satCriticalReadingAvgScoreBar.topAnchor.constraint(equalTo: self.satCriticalReadingAvgScoreLabel.bottomAnchor, constant: 10)
        let heightConstraint = self.satCriticalReadingAvgScoreBar.heightAnchor.constraint(equalToConstant: 1.5)
        let leadingConstraint = self.satCriticalReadingAvgScoreBar.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10)
        let trailingConstraint = self.satCriticalReadingAvgScoreBar.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 10)
        let toActivate = [
            topConstraint,
            heightConstraint,
            leadingConstraint,
            trailingConstraint
        ]
        NSLayoutConstraint.activate(toActivate)
    }

    private func activateSatMathAvgScoreLabelConstraint() {
        let topConstraint = self.satMathAvgScoreLabel.topAnchor.constraint(equalTo: self.satCriticalReadingAvgScoreBar.bottomAnchor, constant: 20)
        let xConstraint = self.satMathAvgScoreLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        let heightConstraint = self.satMathAvgScoreLabel.heightAnchor.constraint(equalToConstant: 20)
        let toActivate = [
            topConstraint,
            heightConstraint,
            xConstraint,
        ]
        NSLayoutConstraint.activate(toActivate)
    }

    private func activateSatMathAvgScoreBarConstraint() {
        let topConstraint = self.satMathAvgScoreBar.topAnchor.constraint(equalTo: self.satMathAvgScoreLabel.bottomAnchor, constant: 10)
        let heightConstraint = self.satMathAvgScoreBar.heightAnchor.constraint(equalToConstant: 1.5)
        let leadingConstraint = self.satMathAvgScoreBar.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10)
        let trailingConstraint = self.satMathAvgScoreBar.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 10)
        let toActivate = [
            topConstraint,
            heightConstraint,
            leadingConstraint,
            trailingConstraint
        ]
        NSLayoutConstraint.activate(toActivate)
    }

    private func activateSatWritingAvgScoreLabelConstraint() {
        let topConstraint = self.satWritingAvgScoreLabel.topAnchor.constraint(equalTo: self.satMathAvgScoreBar.bottomAnchor, constant: 20)
        let xConstraint = self.satWritingAvgScoreLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        let heightConstraint = self.satWritingAvgScoreLabel.heightAnchor.constraint(equalToConstant: 20)
        let toActivate = [
            topConstraint,
            heightConstraint,
            xConstraint,
        ]
        NSLayoutConstraint.activate(toActivate)
    }

    private func activateSatWritingAvgScoreBarConstraint() {
        let topConstraint = self.satWritingAvgScoreBar.topAnchor.constraint(equalTo: self.satWritingAvgScoreLabel.bottomAnchor, constant: 10)
        let bottomConstraint = self.satWritingAvgScoreBar.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -30)
        let heightConstraint = self.satWritingAvgScoreBar.heightAnchor.constraint(equalToConstant: 1.5)
        let leadingConstraint = self.satWritingAvgScoreBar.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10)
        let trailingConstraint = self.satWritingAvgScoreBar.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 10)
        let toActivate = [
            topConstraint,
            bottomConstraint,
            heightConstraint,
            leadingConstraint,
            trailingConstraint
        ]
        NSLayoutConstraint.activate(toActivate)
    }

    fileprivate func activateConstraints() {
        self.activateNumOfSatTestTakersLabelConstraints()
        self.activateSatCriticalReadingAvgScoreLabelConstraints()
        self.activateSatCriticalReadingAvgScoreBarConstraints()
        self.activateSatMathAvgScoreLabelConstraint()
        self.activateSatMathAvgScoreBarConstraint()
        self.activateSatWritingAvgScoreLabelConstraint()
        self.activateSatWritingAvgScoreBarConstraint()
    }
}
