//
//  CustomCell.swift
//  ExampleApp
//
//  Created by Jakub Olejník on 12/11/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import UIKit

final class CustomCell: UITableViewCell {
    static let reuseIdentifier = "CustomCell"
    
    var user: User? {
        didSet {
            descriptionLabel.text = user?.description
            nameLabel.text = user?.name
        }
    }
    
    private weak var descriptionLabel: UILabel!
    private weak var nameLabel: UILabel!
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let avatar = UIImageView()
        avatar.backgroundColor = .lightGray
        avatar.layer.cornerRadius = 30
        avatar.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(avatar)
        NSLayoutConstraint.activate([
            avatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            avatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            avatar.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -15),
            avatar.widthAnchor.constraint(equalToConstant: 60),
            avatar.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        let descriptionLabel = UILabel()
        descriptionLabel.textColor = .lightGray
        descriptionLabel.font = .systemFont(ofSize: 12)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            descriptionLabel.topAnchor.constraint(equalTo: avatar.topAnchor),
        ])
        self.descriptionLabel = descriptionLabel
        
        let nameLabel = UILabel()
        nameLabel.numberOfLines = 0
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 6),
            nameLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            nameLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -15),
        ])
        self.nameLabel = nameLabel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
