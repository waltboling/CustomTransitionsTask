//
//  ViewController.swift
//  CustomTransitionsTask
//
//  Created by Jon Boling on 6/26/18.
//  Copyright © 2018 Walt Boling. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var avengersImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       navigationController?.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCharacter" {
            let toViewController = segue.destination as UIViewController
            toViewController.transitioningDelegate = self
        }
    }
    
    
    @IBAction func enterButtonWasTapped(_ sender: Any) {
        performSegue(withIdentifier: "toMenu", sender: self)
    }
    
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let showAnimator = ShowAnimator()
        
        if operation == .push {
            showAnimator.pushing = true
            //showAnimator.addToViewController(viewController: toVC) //adding gesture transition
        }
        
        return showAnimator
    }
    
}

