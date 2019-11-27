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
    private weak var scoreLabel: UILabel!
    private weak var descriptionLabel: UILabel!
    private weak var infoLabel: UILabel!
    private weak var ingredientsLabel: UILabel!

    private let recipe: Recipe
    private var recipeDetail: RecipeDetail? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                if let recipeDetail = self?.recipeDetail {
                    self?.loading.stopAnimating()
                    self?.titleLabel.text = recipeDetail.name.trimmingCharacters(in: .whitespacesAndNewlines)
                    self?.scoreLabel.text = "Score: \(recipeDetail.score)"
                    self?.descriptionLabel.text = recipeDetail.description.trimmingCharacters(in: .whitespacesAndNewlines)
                    self?.infoLabel.text = recipeDetail.info.trimmingCharacters(in: .whitespacesAndNewlines)
                    self?.ingredientsLabel.text = recipeDetail.ingredients.map { $0.text }.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines)
                }
            }
        }
    }

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

        let scoreLabel = UILabel()
        scoreLabel.font = .preferredFont(forTextStyle: .footnote)
        self.scoreLabel = scoreLabel

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

        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        let contentView = UIStackView(arrangedSubviews: [
            titleLabel,
            scoreLabel,
            descriptionLabel,
            infoLabel,
            ingredientsLabel
        ])
        contentView.axis = .vertical
        contentView.spacing = 15
        contentView.layoutMargins = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        contentView.isLayoutMarginsRelativeArrangement = true
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Detail inzerátu"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Ohodnotit", style: .plain, target: self, action: #selector(ratingButtonTapped))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        APIService.shared.fetchRecipeDetail(recipe: recipe) { [weak self] in self?.recipeDetail = $0 }
    }

    // MARK: - Actions

    @objc
    private func ratingButtonTapped(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Hodnocení receptu", message: nil, preferredStyle: .alert)
        [1, 2, 3, 4, 5].forEach { score in
            let action = UIAlertAction(title: "\(score)", style: .default) { [weak self] _ in
                guard let recipe = self?.recipe else { return }
                APIService.shared.rate(score, recipe: recipe) {
                    APIService.shared.fetchRecipeDetail(recipe: recipe) { self?.recipeDetail = $0 }
                }
            }
            alertController.addAction(action)
        }

        present(alertController, animated: true)
    }
}
