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
    @IBOutlet weak var chooseCharacterLabel: UILabel!
    
    var clickedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
    }

    override func viewWillAppear(_ animated: Bool) {
        setBtnImages()
    }
    override func viewWillDisappear(_ animated: Bool) {
        chooseCharacterLabel.text = ""
    }
    
    //to set image and improve their content mode
    func setBtnImages() {
        ironManButton.setBackgroundImage(#imageLiteral(resourceName: "IronMan"), for: .normal)
        ironManButton.layoutIfNeeded()
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
    }
    
    //for presenting/dismissing modal view
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
    
    //prepare for segue and pass current button's image and label
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
    
    //character button actions & setting current button
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
