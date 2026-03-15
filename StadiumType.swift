//
//  Stadium.swift
//  Max
//
//  Created by Vladimir Soshin on 14.03.2026.
//
import DataDetection
import CoreLocation

class Stadium {
    let name: String
    let imageName: String
    let coordinate: CLLocationCoordinate2D
    var games: [Game] = [Game(title: "Yui", date: Date.now)]
    
    init(name: String, imageName: String, coordinate: CLLocationCoordinate2D) {
        self.name = name
        self.imageName = imageName
        self.coordinate = coordinate
    }
}
