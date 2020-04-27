//
//  SchoolsRootView.swift
//  FluffyWinner_iOS
//
//  Created by Ariel Rodriguez on 27/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import UIKit
import FluffyWinnerUIKit
import MapKit

public class SchoolsRootView: NiblessView {
    private static let pinIdentifier = "pin"
    private var hierarchyNotReady = true
    private var mapLoaded = false

    var mapView: MKMapView = {
        let mapView = MKMapView(frame: .zero)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.showsUserLocation = true
        mapView.register(MKMarkerAnnotationView.self,
                         forAnnotationViewWithReuseIdentifier: SchoolsRootView.pinIdentifier)

        return mapView
    }()

    public override func didMoveToWindow() {
        super.didMoveToWindow()

        guard hierarchyNotReady else {
            return
        }

        self.constructHierarchy()
        self.activateConstraints()

        self.backgroundColor = UIColor.white

        self.hierarchyNotReady = false
    }

    public func setRegion(latitude: Double, longitude: Double, span: Double) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude,
                                                longitude: longitude)
        let region = MKCoordinateRegion(center: coordinate,
                                        latitudinalMeters: span,
                                        longitudinalMeters: span)
        self.mapView.setRegion(region, animated: true)
    }
}

extension SchoolsRootView { // MARK: - Helpers
    fileprivate func constructHierarchy() {
        self.addSubview(self.mapView)
        self.mapView.delegate = self
    }

    private func activateMapViewConstraints() {
        let xConstraint = self.mapView.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor)
        let yConstraint = self.mapView.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor)
        let width = self.mapView.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor)
        let heigth = self.mapView.heightAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor)
        let toActivate = [
            xConstraint,
            yConstraint,
            width,
            heigth
        ]
        NSLayoutConstraint.activate(toActivate)
    }

    fileprivate func activateConstraints() {
        self.activateMapViewConstraints()
    }
}


extension SchoolsRootView: MKMapViewDelegate {
    public func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        self.mapLoaded = false
    }

    public func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        self.mapLoaded = true
    }

    public func mapView(_ mapView: MKMapView,
                        viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }

        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: SchoolsRootView.pinIdentifier,
                                                                   for: annotation)
        annotationView.canShowCallout = true
        annotationView.rightCalloutAccessoryView = UIButton(type: .infoDark)

        return annotationView
    }
}
