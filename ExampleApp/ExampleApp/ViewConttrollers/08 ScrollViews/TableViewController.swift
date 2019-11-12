//
//  TableViewController.swift
//  ExampleApp
//
//  Created by Jakub Olejník on 12/11/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import UIKit

final class TableViewController: UIViewController { // UITableViewController
    private weak var tableView: UITableView!
    
    private var data = User.exampleData
    
    // MARK: - View life cycle
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        
        let tableView = UITableView()
        tableView.refreshControl = UIRefreshControl()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        self.tableView = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(NativeCell.self, forCellReuseIdentifier: NativeCell.reuseIdentifier)
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.refreshControl?.addTarget(self, action: #selector(refreshTriggered(_:)), for: .valueChanged)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
    }
    
    // MARK: - UI actions
    
    
    
    // MARK: - UI actions
    
    @objc
    private func editTapped() {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    @objc
    private func refreshTriggered(_ sender: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            sender.endRefreshing()
        }
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch Section(rawValue: indexPath.section)! {
        case .native:
            let cell = tableView.dequeueReusableCell(withIdentifier: NativeCell.reuseIdentifier, for: indexPath) as! NativeCell
            cell.user = data[indexPath.row]
            return cell
        case .custom:
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
            cell.user = data[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        Section.allCases.count
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(#function, indexPath)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        Section(rawValue: section)?.title
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        data.remove(at: indexPath.row)
        
        let indexPaths = Section.allCases.map { IndexPath(row: indexPath.row, section: $0.rawValue) }
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
}

extension TableViewController {
    final class NativeCell: UITableViewCell {
        static let reuseIdentifier = "NativeCell"
        
        var user: User? {
            didSet {
                textLabel?.text = user?.name
                detailTextLabel?.text = user?.description
            }
        }
        
        // MARK: - Initializers
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
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
    
    enum Section: Int, CaseIterable {
        case native, custom
        
        var title: String {
            switch self {
            case .native: return "Native"
            case .custom: return "Custom"
            }
        }
    }
}
