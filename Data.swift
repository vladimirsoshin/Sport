//
//  Data.swift
//  Max
//
//  Created by Vladimir Soshin on 15.03.2026.
//

import Foundation
import CoreLocation
class DataStore {
    static let shared = DataStore()
    var stadiums: [Stadium] = []
    var currentUser = User(name: "Player")
    
    private init() {
        let stadium1 = Stadium(
            name: "8х8, покрытие искусственное",
            imageName: "2поле", coordinate: CLLocationCoordinate2D(latitude: 59.965637, longitude: 30.308295)
        )

        let stadium2 = Stadium(
            name: "5Х5,  покрытие искусственное",
            imageName: "3поле", coordinate: CLLocationCoordinate2D(latitude: 59.968054, longitude: 30.274807)
        )
        
        let stadium3 = Stadium(
            name: "5х5, покрытие резиновое",
            imageName: "4поле", coordinate: CLLocationCoordinate2D(latitude: 59.961408, longitude: 30.290400)
        )
        
        let stadium4 = Stadium(
            name: "6х6, искусственный газон",
            imageName: "5поле", coordinate: CLLocationCoordinate2D(latitude: 59.962538, longitude: 30.297727)
        )

        stadiums = [stadium1, stadium2, stadium3, stadium4]
    }
    
}

