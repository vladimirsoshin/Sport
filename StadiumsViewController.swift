//
//  ViewController.swift
//  Max
//
//  Created by Vladimir Soshin on 14.03.2026.
//

import UIKit

class StadiumsTableViewController: UITableViewController {
    var stadiums: [Stadium] {
        DataStore.shared.stadiums
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Stadiums"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.separatorStyle = .none
        tableView.register(StadiumCell.self, forCellReuseIdentifier: StadiumCell.identifier)
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

        let lobbyVC = LobbyTableViewController()

        lobbyVC.stadium = stadiums[indexPath.row]

        navigationController?.pushViewController(lobbyVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }

}

