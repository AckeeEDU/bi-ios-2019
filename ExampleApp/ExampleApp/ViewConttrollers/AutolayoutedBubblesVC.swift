//
//  AutolayoutedBubblesVC.swift
//  ExampleApp
//
//  Created by Jiri Ostatnicky on 17/10/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import UIKit

class AutolayoutedBubblesVC: UIViewController {
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        print("segue to: \(segue.destination)")
    }
    
    var bubbleViews: [UIView] = []

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
            bubbleView.removeFromSuperview() // Toto odstraní i konstrainty
        }
        
        // "vynulování" uložených bublin
        bubbleViews = []
        
        for _ in (0..<20) {
            let bubbleView = generateRandomBubble()
            
            // přidání do self.view
            view.addSubview(bubbleView)
            
            // aktivace konstraints musí být až za `addSubview`
//            generateCenteringConstraints(forBubble: bubbleView) // Jednoduché řešení, centerování na střed
            generateConstraints(forBubble: bubbleView)
            
            // uložení do pole všech bublin pro pozdější snadnější odstranění
            bubbleViews.append(bubbleView)
        }
        
        // přesunutí fire buttonu do popředí
        view.bringSubviewToFront(fireButton)
    }
    
    private func generateRandomBubble() -> UIView {
        let randomSize = random(min: 1, max: 80)
        let bubbleView = UIView()
        bubbleView.layer.cornerRadius = randomSize / 2
        bubbleView.backgroundColor = UIColor(red: random(), green: random(), blue: random(), alpha: 1)
        bubbleView.translatesAutoresizingMaskIntoConstraints = false
        return bubbleView
    }
    
    // Jednoduché řešení, centerování na střed
    private func generateCenteringConstraints(forBubble bubbleView: UIView) {
        guard let superView = bubbleView.superview else { return } // (superView = self.view)
        let size = bubbleView.layer.cornerRadius * 2
        let minWidth = -superView.frame.width / 2
        let maxWidth = superView.frame.width / 2
        let minHeight = -superView.frame.height / 2
        let maxHeight = superView.frame.height / 2
        NSLayoutConstraint.activate([
            bubbleView.widthAnchor.constraint(equalToConstant: size),
            bubbleView.heightAnchor.constraint(equalToConstant: size),
            bubbleView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: random(min: minWidth, max: maxWidth)),
            bubbleView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: random(min: minHeight, max: maxHeight)),
        ])
    }
    
    // Toto řešení generuje bubbles v čtvercovém rozmezí (max(screen.width, screen.height))
    // a pak konstraintama na top, leading, trailing a bottom se vynutí zobrazení na obrazovce,
    // když kulička přesahuje.
    private func generateConstraints(forBubble bubbleView: UIView) {
        guard let superView = bubbleView.superview else { return } // (superView = self.view)
        let size = bubbleView.layer.cornerRadius * 2
        let maxLenght = max(superView.frame.width, superView.frame.height)
        let min = -maxLenght / 2
        let max = maxLenght / 2
        let randomeXOffset = random(min: min, max: max)
        let randomeYOffset = random(min: min, max: max)
        let centerX = bubbleView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: randomeXOffset)
        let centerY = bubbleView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: randomeYOffset)
        centerX.priority = .defaultHigh // Menší priorita pro centrování, aby kuličky zůstali na obrazovce
        centerY.priority = .defaultHigh
        NSLayoutConstraint.activate([
            bubbleView.widthAnchor.constraint(equalToConstant: size),
            bubbleView.heightAnchor.constraint(equalToConstant: size),
            centerX,
            centerY,
            bubbleView.topAnchor.constraint(greaterThanOrEqualTo: superView.topAnchor),
            bubbleView.leadingAnchor.constraint(greaterThanOrEqualTo: superView.leadingAnchor),
            bubbleView.bottomAnchor.constraint(lessThanOrEqualTo: superView.bottomAnchor),
            bubbleView.trailingAnchor.constraint(lessThanOrEqualTo: superView.trailingAnchor),
        ])
    }
    
    func random(min: CGFloat = 0, max: CGFloat = 1) -> CGFloat {
        let rand = CGFloat(arc4random()) / 0xFFFFFFFF
        return rand * (max - min) + min
    }
}
