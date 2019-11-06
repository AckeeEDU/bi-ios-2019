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
    
    var bubbleViews: [UIView] = []

    @IBAction func didPressCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func fireButtonTapped(_ sender: UIButton) {
        print("Fire! \(random(min: 0, max: 1))")
        
        // Vygenerovat 20 kuliček
        // - random velikost
        // - random umístění
        // - random barva
        // - všechny kuličky musí být aspoň částí viditelné na obrazovce
        // - tlačítko fire musí být always on top

        //########## ŘEŠENÍ ##########
        
        // odstranění existujících bublin
        for bubbleView in bubbleViews {
            bubbleView.removeFromSuperview()
        }
        
        // "vynulování" uložených bublin
        bubbleViews = []
        
        for _ in (0..<20) {
            let bubbleView = generateRandomBubble()
            
            // přidání do self.view
            view.addSubview(bubbleView)
            
            // uložení do pole všech bublin pro pozdější snadnější odstranění
            bubbleViews.append(bubbleView)
        }
        
        // přesunutí fire buttonu do popředí
        view.bringSubviewToFront(fireButton)
    }
    
    private func generateRandomBubble() -> UIView {
        let randomSize = random(min: 1, max: 80)
        let bubbleView = UIView(frame: CGRect(x: random(min: 0, max: view.frame.width),
                                              y: random(min: 0, max: view.frame.height),
                                              width: randomSize,
                                              height: randomSize))
        bubbleView.layer.cornerRadius = randomSize / 2
        bubbleView.backgroundColor = UIColor(red: random(), green: random(), blue: random(), alpha: 1)
        return bubbleView
    }
    
    func random(min: CGFloat = 0, max: CGFloat = 1) -> CGFloat {
        let rand = CGFloat(arc4random()) / 0xFFFFFFFF
        return rand * (max - min) + min
    }
}

