//
//  MainTabBarController.swift
//  Max
//
//  Created by Vladimir Soshin on 15.03.2026.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let stadiumsVC = StadiumsTableViewController()
        let profileVC = ProfileViewController()
        let mapVC = MapViewController()

        let stadiumsNav = UINavigationController(rootViewController: stadiumsVC)
        let profileNav = UINavigationController(rootViewController: profileVC)
        let mapNav = UINavigationController(rootViewController: mapVC)
        stadiumsNav.tabBarItem = UITabBarItem(
            title: "Stadiums",
            image: UIImage(systemName: "sportscourt"),
            tag: 0
        )

        profileNav.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person"),
            tag: 2
        )
        
        mapNav.tabBarItem = UITabBarItem(
            title: "Map",
            image: UIImage(systemName: "map"),
            tag: 1
        )


        viewControllers = [stadiumsNav, mapNav ,profileNav]
    }
}
