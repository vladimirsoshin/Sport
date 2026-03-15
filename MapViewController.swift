//
//  MapViewController.swift
//  Max
//
//  Created by Vladimir Soshin on 15.03.2026.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    let mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Map"
        view.backgroundColor = .systemBackground
        
        mapView.frame = view.bounds
        view.addSubview(mapView)
        showStadiums()
    }
    
    func showStadiums() {
        let stadiums = DataStore.shared.stadiums
        
        for stadium in stadiums {
            let annotation = MKPointAnnotation()
            annotation.title = stadium.name
            annotation.coordinate = stadium.coordinate
            
            mapView.addAnnotation(annotation)
        }
    }
}
