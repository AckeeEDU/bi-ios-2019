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
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        self.collectionView = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
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

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width / 2, height: collectionView.bounds.width / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print(#function, indexPath)
    }
}

extension CollectionViewController {
    final class Cell: UICollectionViewCell {
        static let reuseIdentifier = "Cell"
        
        var user: User? {
            didSet {
                nameLabel.text = user?.name
                contentView.backgroundColor = user?.color
            }
        }
        
        private weak var nameLabel: UILabel!
        
        // MARK: - Initializers
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            let nameBackground = UIView()
            nameBackground.backgroundColor = UIColor.white.withAlphaComponent(0.8)
            nameBackground.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(nameBackground)
            NSLayoutConstraint.activate([
                nameBackground.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                nameBackground.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                nameBackground.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
            
            let nameLabel = UILabel()
            nameLabel.numberOfLines = 0
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            nameBackground.addSubview(nameLabel)
            NSLayoutConstraint.activate([
                nameLabel.leadingAnchor.constraint(equalTo: nameBackground.leadingAnchor, constant: 10),
                nameLabel.trailingAnchor.constraint(equalTo: nameBackground.trailingAnchor, constant: -10),
                nameLabel.topAnchor.constraint(equalTo: nameBackground.topAnchor, constant: 10),
                nameLabel.bottomAnchor.constraint(equalTo: nameBackground.bottomAnchor, constant: -10)
            ])
            self.nameLabel = nameLabel
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
