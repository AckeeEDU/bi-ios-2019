//
//  ScrollViewController.swift
//  ExampleApp
//
//  Created by Jakub Olejník on 12/11/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import UIKit

final class ScrollViewController: UIViewController {
    private weak var scrollView: UIScrollView!
    private weak var contentView: UIStackView!
    
    // MARK: - View life cycle
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.refreshControl = UIRefreshControl()
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.contentLayoutGuide.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])
        self.scrollView = scrollView
        
        let contentView = UIStackView()
        contentView.axis = .vertical
        contentView.spacing = 20
        contentView.isLayoutMarginsRelativeArrangement = true
        contentView.layoutMargins = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
        ])
        self.contentView = contentView
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.refreshControl?.addTarget(self, action: #selector(refreshTriggered(_:)), for: .valueChanged)
        
        (1...50).forEach { i in
            let label = UILabel()
            label.numberOfLines = 0
            label.text = "[\(i)] Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut posuere tempus dui, non laoreet metus egestas luctus. Ut rutrum sollicitudin mauris, vitae luctus nulla posuere nec. Mauris ante lacus, sodales in dolor et, molestie hendrerit nibh. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ultrices mi nisi, luctus ultrices libero tristique in. Sed posuere eros eu iaculis porttitor. Nulla lacus lacus, rhoncus eget luctus lacinia, consequat vitae quam. Duis blandit id sem tempus egestas. Sed tincidunt dui hendrerit quam auctor facilisis. Curabitur ullamcorper velit vitae maximus dignissim. Aenean lectus justo, tempus non consequat eget, sodales eget odio."
            contentView.addArrangedSubview(label)
        }
    }
    
    // MARK: - UI actions
    
    @objc
    private func refreshTriggered(_ sender: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            sender.endRefreshing()
        }
    }
}
