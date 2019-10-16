//
//  AutolayoutViewController.swift
//  ExampleApp
//
//  Created by Jiri Ostatnicky on 16/10/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import UIKit

class AutolayoutViewController: UIViewController {
    
    @IBOutlet weak var weatherHeightConstraint: NSLayoutConstraint!
    
    private var isExtended = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func didTouchButton(_ sender: Any) {
        toggleWeatherRow()
    }
}

// MARK: - Private
private extension AutolayoutViewController {
    
    func setupUI() {
        let label = UILabel()
        label.text = "FROM CODE: Really long text. Really long text. Really long text. Really long text. Really long text. Really long text. Really long text. Really long text. Really long text."
        label.textColor = .red
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        let margin = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: margin.leadingAnchor),
            label.bottomAnchor.constraint(equalTo: margin.bottomAnchor),
            label.trailingAnchor.constraint(equalTo: margin.trailingAnchor)
        ])
        
        additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func toggleWeatherRow() {
        isExtended.toggle()
        weatherHeightConstraint.constant = isExtended ? 150 : 50
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

