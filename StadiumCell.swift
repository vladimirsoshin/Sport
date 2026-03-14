//
//  Stadium.swift
//  Max
//
//  Created by Vladimir Soshin on 14.03.2026.
//

import Foundation
import UIKit

class StadiumCell: UITableViewCell {
    static let identifier = "stadiumId"
    
    let stadiumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "2поле")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "поле"
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(stadiumImageView)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            
            stadiumImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stadiumImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stadiumImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stadiumImageView.heightAnchor.constraint(equalToConstant: 180),
            
            titleLabel.topAnchor.constraint(equalTo: stadiumImageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: stadiumImageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: stadiumImageView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
