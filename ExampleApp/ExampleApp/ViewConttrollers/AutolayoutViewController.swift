//
//  AutolayoutViewController.swift
//  ExampleApp
//
//  Created by Jiri Ostatnicky on 16/10/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import UIKit

class AutolayoutViewController: UIViewController {
    
    // MARK: - UI
    @IBOutlet weak var weatherHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var weatherRow: UIView!
    
    // MARK: - Private properties
    private var isExtended = false
    private var labelTopConstraint: NSLayoutConstraint?
    private var labelBottomConstraint: NSLayoutConstraint?
    
    // MARK: - Life cycle
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
        // Label creation
        let label = UILabel()
        label.text = "FROM CODE: Really long text. Really long text. Really long text. Really long text. Really long text. Really long text. Really long text. Really long text. Really long text."
        label.textColor = .red
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false // IMPORTANT!
        view.addSubview(label)
        
        // Label's constraints definition
        let margin = view.safeAreaLayoutGuide
        let labelTopConst = label.topAnchor.constraint(equalTo: weatherRow.bottomAnchor)
        labelTopConst.priority = .defaultLow
        let labelBottomConst = label.bottomAnchor.constraint(equalTo: margin.bottomAnchor)
        labelBottomConst.priority = .defaultHigh
        labelTopConstraint = labelTopConst
        labelBottomConstraint = labelBottomConst
        
        NSLayoutConstraint.activate([
            labelTopConst,
            label.leadingAnchor.constraint(equalTo: margin.leadingAnchor),
            labelBottomConst,
            label.trailingAnchor.constraint(equalTo: margin.trailingAnchor)
        ])
        
        // Custom left and right margin for safe area
        additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func toggleWeatherRow() {
        isExtended.toggle()
        weatherHeightConstraint.constant = isExtended ? 150 : 50
        labelTopConstraint?.priority = isExtended ? .defaultHigh : .defaultLow
        labelBottomConstraint?.priority = isExtended ? .defaultLow : .defaultHigh
        
        UIView.animate(withDuration: 0.3) {
            self.weatherRow.backgroundColor = self.isExtended ? .systemRed : .systemYellow
            self.view.layoutIfNeeded()
        }
    }
}

