//
//  LobbyTableViewController.swift
//  Max
//
//  Created by Vladimir Soshin on 14.03.2026.
//

import UIKit

class LobbyTableViewController: UITableViewController {
    var stadium: Stadium!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = stadium?.name
        navigationItem.largeTitleDisplayMode = .never
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addLobby))
        
        tableView.register(LobbyCell.self, forCellReuseIdentifier: LobbyCell.identifier)
    }
    
    @objc func addLobby() {
        let vc = AddGameViewController()
        
        vc.delegate = self
        
        navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stadium.games.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LobbyCell.identifier, for: indexPath) as! LobbyCell
        let lobby = stadium.games[indexPath.row]
        
        cell.configure(with: lobby)
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {

        tableView.deselectRow(at: indexPath, animated: true)

        let game = stadium.games[indexPath.row]

        let currentUser = "You"

        if !game.players.contains(currentUser) {
            game.players.append(currentUser)
        }
        showAlert(game)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func showAlert(_ game: Game) {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.dateStyle = .short
        
        let stringDate = formatter.string(from: game.date)
        
        let alert = UIAlertController(
            title: "Success",
            message: "You have joined \(stringDate) at \(game.title)",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert, animated: true)
    }

}

extension LobbyTableViewController: AddGameViewControllerDelegate {
    func didCreateGame(_ game: Game) {
        stadium.games.append(game)
        game.players.append("You")
        tableView.reloadData()
    }
}
