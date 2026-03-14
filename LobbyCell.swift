//
//  LobbyCell.swift
//  Max
//
//  Created by Vladimir Soshin on 14.03.2026.
//

import UIKit

class LobbyCell: UITableViewCell {
    static let identifier = "LobbyCell"
    
    let dateLabel: UILabel = {
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(dateLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(playersLabel)

        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),

            timeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 6),
            timeLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),

            playersLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            playersLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            playersLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
}
