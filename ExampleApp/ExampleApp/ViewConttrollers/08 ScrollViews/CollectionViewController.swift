//
//  CollectionViewController.swift
//  ExampleApp
//
//  Created by Jakub Olejník on 12/11/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import UIKit

final class CollectionViewController: UIViewController { // UICollectionViewController
    private weak var collectionView: UICollectionView!
    
    private var data = User.exampleData
    
    // MARK: - View life cycle
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        self.collectionView = collectionView
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.reuseIdentifier, for: indexPath) as! Cell
        cell.user = data[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
}

extension CollectionViewController {
    final class Cell: UICollectionViewCell {
        static let reuseIdentifier = "Cell"
        
        var user: User? {
            didSet { }
        }
    }
}
