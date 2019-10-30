//
//  ConsoleViewController.swift
//  ExampleApp
//
//  Created by Dominik Vesely on 30/10/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import Foundation
import UIKit

class ConsoleViewController : UIViewController {
    
    
    
    
    let viewModel : ActionViewModel

    init (viewModel: ActionViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        print(viewModel.overView)
        viewModel.shapes.forEach { (shape) in
            print("Shape \(shape.tag) Color: \(shape.color) Origin: \(shape.origin.x) \(shape.origin.y) Size: \(shape.size)  ")
        }
        
    }

    
    
}
