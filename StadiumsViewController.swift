//
//  ViewController.swift
//  Max
//
//  Created by Vladimir Soshin on 14.03.2026.
//

import UIKit

class StadiumsTableViewController: UITableViewController {
    //let cellId = "StadiumsCellID"
    var stadiums = [Stadium]()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Stadiums"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(StadiumCell.self, forCellReuseIdentifier: StadiumCell.identifier)
        
        stadiums = [Stadium(name: "поле для игры 8х8, покрытие искусственное", imageName: "2поле"),
                    Stadium(name: "5Х5,  покрытие искусственное", imageName: "3поле")]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stadiums.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StadiumCell.identifier, for: indexPath) as! StadiumCell
        let stadium = stadiums[indexPath.row]
        cell.titleLabel.text = stadium.name
        cell.stadiumImageView.image = UIImage(named: stadium.imageName)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }

}

