//
//  ShownViewController.swift
//  CustomTransitionsTask
//
//  Created by Jon Boling on 6/26/18.
//  Copyright © 2018 Walt Boling. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var ironManButton: UIButton!
    @IBOutlet weak var blackPantherButton: UIButton!
    @IBOutlet weak var spidermanButton: UIButton!
    @IBOutlet weak var blackWidowButton: UIButton!
    @IBOutlet weak var captainAmericaButton: UIButton!
    @IBOutlet weak var hulkButton: UIButton!
    @IBOutlet weak var avengersImageView: UIImageView!

    
    var clickedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Avengers Menu"
        //setBtnImages()
    }

    override func viewWillAppear(_ animated: Bool) {
        setBtnImages()
        
        
    }
    
    func setBtnImages() {
        ironManButton.setBackgroundImage(#imageLiteral(resourceName: "IronMan"), for: .normal)
        ironManButton.layoutIfNeeded() // this and next to improve btn content mode
        ironManButton.subviews.first?.contentMode = .scaleAspectFill
        blackPantherButton.setBackgroundImage(#imageLiteral(resourceName: "BlackPanther"), for: .normal)
        blackPantherButton.layoutIfNeeded()
        blackPantherButton.subviews.first?.contentMode = .scaleAspectFill
        spidermanButton.setBackgroundImage(#imageLiteral(resourceName: "spiderman"), for: .normal)
        spidermanButton.layoutIfNeeded()
        spidermanButton.subviews.first?.contentMode = .scaleAspectFill
        blackWidowButton.setBackgroundImage(#imageLiteral(resourceName: "BlackWidow"), for: .normal)
        blackWidowButton.layoutIfNeeded()
        blackWidowButton.subviews.first?.contentMode = .scaleAspectFill
        captainAmericaButton.setBackgroundImage(#imageLiteral(resourceName: "CaptainAmerica"), for: .normal)
        captainAmericaButton.layoutIfNeeded()
        captainAmericaButton.subviews.first?.contentMode = .scaleAspectFill
        hulkButton.setBackgroundImage(#imageLiteral(resourceName: "hulk"), for: .normal)
        hulkButton.layoutIfNeeded()
        hulkButton.subviews.first?.contentMode = .scaleAspectFill
        /*
    //ironManButton.imageView?.image = #imageLiteral(resourceName: "IronMan")
    ironManButton.imageView?.contentMode = .scaleAspectFill
        ironManButton.setImage(#imageLiteral(resourceName: "IronMan"), for: .normal)
    //blackPantherButton.imageView?.image = #imageLiteral(resourceName: "BlackPanther")
    blackPantherButton.imageView?.contentMode = .scaleAspectFill
        blackPantherButton.setImage(#imageLiteral(resourceName: "BlackPanther"), for: .normal)
    //spidermanButton.imageView?.image = #imageLiteral(resourceName: "spiderman")
    spidermanButton.imageView?.contentMode = .scaleAspectFill
        spidermanButton.setImage(#imageLiteral(resourceName: "spiderman"), for: .normal)
    //blackWidowButton.imageView?.image = #imageLiteral(resourceName: "BlackWidow")
    blackWidowButton.imageView?.contentMode = .scaleAspectFill
        blackWidowButton.setImage(#imageLiteral(resourceName: "BlackWidow"), for: .normal)
    //captainAmericaButton.imageView?.image = #imageLiteral(resourceName: "CaptainAmerica")
    captainAmericaButton.imageView?.contentMode = .scaleAspectFill
        captainAmericaButton.setImage(#imageLiteral(resourceName: "CaptainAmerica"), for: .normal)
    //hulkButton.imageView?.image = #imageLiteral(resourceName: "hulk")
    hulkButton.imageView?.contentMode = .scaleAspectFill
        hulkButton.setImage(#imageLiteral(resourceName: "hulk"), for: .normal)
    */
    }
    
    //for presenting/dismissing modal view
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
    
    
    //prepare for segue and get current button's image and label
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCharacterView" {
            let destinationVC = segue.destination as! CharacterViewController
            destinationVC.transitioningDelegate = self
            destinationVC.image = clickedButton.backgroundImage(for: .normal)
            destinationVC.passedCharacterName = clickedButton.titleLabel?.text
        }
    }
    
    //to get current button and perform segue
    func updateCurrentButton(currentButton: UIButton){
        clickedButton = currentButton
        performSegue(withIdentifier: "toCharacterView", sender: self)
    }
    
    //character buttons & setting current button
    @IBAction func ironManWasTapped(_ sender: Any) {
        updateCurrentButton(currentButton: ironManButton)
    }
    
    @IBAction func blackPantherWasTapped(_ sender: Any) {
        updateCurrentButton(currentButton: blackPantherButton)
    }
    
    @IBAction func spidermanWasTapped(_ sender: Any) {
        updateCurrentButton(currentButton: spidermanButton)
    }
    
    @IBAction func blackWidowWasTapped(_ sender: Any) {
        updateCurrentButton(currentButton: blackWidowButton)
    }
    
    @IBAction func captainAmericaWasTapped(_ sender: Any) {
        updateCurrentButton(currentButton: captainAmericaButton)
    }
    
    @IBAction func hulkWasTapped(_ sender: Any) {
        updateCurrentButton(currentButton: hulkButton)
    }
    
    
    
    

}
