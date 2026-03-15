//
//  AddLobbyTableViewController.swift
//  Max
//
//  Created by Vladimir Soshin on 14.03.2026.
//

import UIKit

protocol AddGameViewControllerDelegate: AnyObject {
    func didCreateGame(_ game: Game)
}

class AddGameViewController: UIViewController {
    weak var delegate: AddGameViewControllerDelegate?
    
    let titleTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Название игры"
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .dateAndTime
        picker.preferredDatePickerStyle = .wheels   // как в приложении часы
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()

    let createButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Создать игру", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Add Game"

        view.addSubview(titleTextField)
        view.addSubview(datePicker)
        view.addSubview(createButton)

        NSLayoutConstraint.activate([

            titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            datePicker.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 30),
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            createButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 40),
            createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        createButton.addTarget(self, action: #selector(createGame), for: .touchUpInside)
    }
    
    @objc func createGame() {
        guard let title = titleTextField.text, !title.isEmpty else { return }
        
        let newGame = Game(title: title, date: datePicker.date)
        
        delegate?.didCreateGame(newGame)
        
        navigationController?.popViewController(animated: true)
    }
}
