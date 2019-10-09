//
//  BubblesViewController.swift
//  ExampleApp
//
//  Created by Jan Misar on 09/10/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import UIKit

class BubblesViewController: UIViewController {

    @IBOutlet weak var fireButton: UIButton!
    
    override func loadView() {
        super.loadView()
        
        let aView = UIView(frame: CGRect(x: 60, y: 150, width: 120, height: 200))
        aView.backgroundColor = UIColor(red: 0.72, green: 0.23, blue: 0.48, alpha: 1)
        aView.layer.cornerRadius = 20
        view.addSubview(aView)
        
        fireButton.layer.cornerRadius = 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func fireButtonTapped(_ sender: UIButton) {
        print("Fire! \(random(min: 0, max: 1))")
        
        // Vygenerovat 20 kuliček
        // - random velikost
        // - random umístění
        // - random barva
        // - všechny kuličky musí být aspoň částí viditelné na obrazovce
        // - tlačítko fire musí být always on top
        
        // aView.subviews
        // aView.removeFromSuperview()
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        let rand = CGFloat(arc4random()) / 0xFFFFFFFF
        return rand * (max - min) + min
    }
}

