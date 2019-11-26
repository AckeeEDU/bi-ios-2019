//
//  RecipesViewController.swift
//  ExampleApp
//
//  Created by Lukáš Hromadník on 26/11/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import UIKit

final class RecipesViewController: UIViewController {

    private weak var tableView: UITableView!

    // MARK: - Lifecycle

    override func loadView() {
        super.loadView()

        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.tableView = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Recipes"

        tableView.dataSource = self

        APIService.shared.fetchRecipes()
    }
}

extension RecipesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Cell \(indexPath.row + 1)"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
