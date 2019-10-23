//
//  ControlPanel.swift
//  bi-ios-2018
//
//  Created by Dominik Vesely on 06/11/2018.
//  Copyright © 2018 ČVUT. All rights reserved.
//

import Foundation
import UIKit

class ControlPanelView : UIView {
    
    
    weak var colorSegment : UISegmentedControl!
    weak var shapeSegment : UISegmentedControl!
    weak var sizeSlider : UISlider!
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        backgroundColor = .red
        
        let colorSegment = UISegmentedControl(items: ["Red","Green","Blue"])
        colorSegment.selectedSegmentIndex = 0
        self.colorSegment = colorSegment
        let shapeSegment = UISegmentedControl(items: ["Circle","Square"])
        shapeSegment.selectedSegmentIndex = 0
        self.shapeSegment = shapeSegment
        let sizePicker = UISlider()
        sizePicker.minimumValue = 10
        sizePicker.maximumValue = 100
        sizePicker.value = 10
        self.sizeSlider = sizePicker
        
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false // IMPORTANT!

        stack.addArrangedSubview(createHStack(views: createLabel("Color"), colorSegment))
        stack.addArrangedSubview(createHStack(views: createLabel("Shape"), shapeSegment))
        stack.addArrangedSubview(createHStack(views: createLabel("Size"), sizePicker))
        addSubview(stack)
        
        let margin = self.safeAreaLayoutGuide
        
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: margin.topAnchor),
            stack.leadingAnchor.constraint(equalTo: margin.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: margin.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: margin.bottomAnchor)
        ])
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func createHStack(views : UIView...) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: views)
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }
    
    func createLabel(_ text : String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return label
    }
    
    
}
