//
//  RecipeDetailViewController.swift
//  ExampleApp
//
//  Created by Lukáš Hromadník on 26/11/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import UIKit

final class RecipeDetailViewController: UIViewController {

    private weak var loading: UIActivityIndicatorView!
    private weak var titleLabel: UILabel!
    private weak var descriptionLabel: UILabel!
    private weak var infoLabel: UILabel!
    private weak var ingredientsLabel: UILabel!

    private let recipe: Recipe

    // MARK: - Initialization

    init(recipe: Recipe) {
        self.recipe = recipe

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func loadView() {
        super.loadView()

        view.backgroundColor = .white

        let loading = UIActivityIndicatorView(style: .medium)
        loading.startAnimating()
        loading.hidesWhenStopped = true
        view.addSubview(loading)
        loading.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loading.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loading.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        self.loading = loading

        let titleLabel = UILabel()
        titleLabel.font = .preferredFont(forTextStyle: .title1)
        self.titleLabel = titleLabel

        let descriptionLabel = UILabel()
        descriptionLabel.font = .preferredFont(forTextStyle: .body)
        descriptionLabel.numberOfLines = 0
        self.descriptionLabel = descriptionLabel

        let infoLabel = UILabel()
        infoLabel.font = .preferredFont(forTextStyle: .body)
        infoLabel.numberOfLines = 0
        self.infoLabel = infoLabel

        let ingredientsLabel = UILabel()
        ingredientsLabel.font = .preferredFont(forTextStyle: .callout)
        ingredientsLabel.numberOfLines = 0
        self.ingredientsLabel = ingredientsLabel

        let contentView = UIStackView(arrangedSubviews: [
            titleLabel,
            descriptionLabel,
            infoLabel,
            ingredientsLabel
        ])
        contentView.axis = .vertical
        contentView.spacing = 15
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 15)
        ])
    }
}
