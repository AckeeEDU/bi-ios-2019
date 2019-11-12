//
//  DiffableTableViewController.swift
//  ExampleApp
//
//  Created by Jakub Olejník on 12/11/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import UIKit

final class DiffableTableViewController: UIViewController {
    typealias Section = TableSection
    
    private weak var tableView: UITableView!
    
    private lazy var dataSource = UserDataSource(tableView: tableView, cellProvider: DiffableTableViewController.createCell)
    
    // MARK: - View life cycle
    
    override func loadView() {
        super.loadView()
        
        let tableView = UITableView()
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
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.reuseIdentifier)
        tableView.register(NativeCell.self, forCellReuseIdentifier: NativeCell.reuseIdentifier)
        tableView.delegate = self
     
        let initialSnapshot = DiffableTableViewController.createSnapshot(for: User.exampleData)
        dataSource.apply(initialSnapshot, animatingDifferences: false)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
    }
    
    // MARK: - UI actions
    
    @objc
    private func editTapped() {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    // MARK: - Private helpers
    
    private static func createCell(_ tableView: UITableView, indexPath: IndexPath, model: CellType) -> UITableViewCell? {
        switch model {
        case .native(let user):
            let cell = tableView.dequeueReusableCell(withIdentifier: NativeCell.reuseIdentifier, for: indexPath) as! NativeCell
            cell.user = user
            return cell
        case .custom(let user):
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
            cell.user = user
            return cell
        }
    }
    
    private static func createSnapshot(for data: [User]) -> NSDiffableDataSourceSnapshot<Section, CellType> {
        var snapshot = NSDiffableDataSourceSnapshot<Section, CellType>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(data.map { .native($0) }, toSection: .native)
        snapshot.appendItems(data.map { .custom($0) }, toSection: .custom)
        return snapshot
    }
}

extension DiffableTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(#function, indexPath)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
}

extension DiffableTableViewController {
    enum CellType: Hashable {
        case native(User)
        case custom(User)
        
        var user: User {
            switch self {
            case .custom(let user), .native(let user): return user
            }
        }
    }
    
    final class UserDataSource: UITableViewDiffableDataSource<Section, CellType> {
        override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            snapshot().sectionIdentifiers[section].title
        }
        
        override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            true
        }
        
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            var items = snapshot().itemIdentifiers(inSection: .custom)
            items.remove(at: indexPath.row)
            let newSnapshot = DiffableTableViewController.createSnapshot(for: items.map { $0.user })
            apply(newSnapshot)
        }
    }
}
