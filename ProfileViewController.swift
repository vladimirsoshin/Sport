//
//  ProfileViewController.swift
//  Max
//
//  Created by Vladimir Soshin on 15.03.2026.
//

import Foundation
import UIKit


class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    let avatarImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.circle.fill")
        image.tintColor = .systemGray
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Player"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let gamesLabel: UILabel = {
        let label = UILabel()
        label.text = "Games joind: \(DataStore.shared.currentUser.gameJoined)"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Profile"
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.layer.cornerRadius = 60
        avatarImageView.clipsToBounds = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(changeAvatar))
        
        avatarImageView.addGestureRecognizer(tap)
        view.addSubview(avatarImageView)
        view.addSubview(nameLabel)
        view.addSubview(gamesLabel)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "gearshape"),
            style: .plain,
            target: self,
            action: #selector(editProfile))
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            gamesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            gamesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func editProfile() {
        let vc = EditProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func changeAvatar() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            avatarImageView.image = image
        }
        
        dismiss(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let user = DataStore.shared.currentUser
        nameLabel.text = user.name
        gamesLabel.text = "Joined: \(user.gameJoined)"
        
    }
    
}
