//
//  EditProfileViewController.swift
//  Max
//
//  Created by Vladimir Soshin on 15.03.2026.
//

import UIKit

class EditProfileViewController: UIViewController {

    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Your name"
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Edit Profile"

        view.addSubview(nameTextField)
        view.addSubview(saveButton)

        saveButton.addTarget(self, action: #selector(saveProfile), for: .touchUpInside)

        NSLayoutConstraint.activate([

            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            saveButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 30),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc func saveProfile() {

        guard let name = nameTextField.text, !name.isEmpty else { return }

        DataStore.shared.currentUser.name = name

        navigationController?.popViewController(animated: true)
    }
}
