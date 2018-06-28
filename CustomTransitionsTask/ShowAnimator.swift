//
//  ShowAnimator.swift
//  CustomTransitionsTask
//
//  Created by Jon Boling on 6/26/18.
//  Copyright © 2018 Walt Boling. All rights reserved.
//

import UIKit

class ShowAnimator: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    var pushing = false
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
            let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else {
                return
        }
        
        let container = transitionContext.containerView
        
        let initialViewController = !self.pushing ? toViewController as! InitialViewController : fromViewController as! InitialViewController
        let menuViewController = !self.pushing ? fromViewController as! MenuViewController : toViewController as! MenuViewController
        
        let initialView = initialViewController.view
        let menuView = menuViewController.view
        
        // prepare menu items to slide in
        if (self.pushing){
            self.offStageMenuController(menuViewController: menuViewController)
        }
        
        container.addSubview(initialView!)
        container.addSubview(menuView!)
        
        //perform animation
        UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0.8, options: .curveEaseIn, animations: {
            if (self.pushing){
                self.onStageMenuController(menuViewController: menuViewController) // onstage items: slide in
                
                menuViewController.avengersImageView.alpha = 0.5
                initialViewController.avengersImageView.alpha = 0.5
            }
            else {
                self.offStageMenuController(menuViewController: menuViewController) // offstage items: slide out
                menuViewController.avengersImageView.alpha = 1
                initialViewController.avengersImageView.alpha = 1
            }
            
        }, completion: { finished in
            transitionContext.completeTransition(true)
        })
    }
    
    func offStageMenuController(menuViewController: MenuViewController) {
        
        let offstageLeft = CGAffineTransform(translationX: -1000, y: 0)
        let offstageRight = CGAffineTransform(translationX: 1000, y: 0)
        
        menuViewController.ironManButton.transform = offstageLeft
        menuViewController.blackPantherButton.transform = offstageLeft
        menuViewController.spidermanButton.transform = offstageLeft
        menuViewController.blackWidowButton.transform = offstageRight
        menuViewController.captainAmericaButton.transform = offstageRight
        menuViewController.hulkButton.transform = offstageRight
    }
    
    func onStageMenuController(menuViewController: MenuViewController) {
        
        menuViewController.ironManButton.transform = CGAffineTransform.identity
        menuViewController.blackPantherButton.transform = CGAffineTransform.identity
        menuViewController.spidermanButton.transform = CGAffineTransform.identity
        menuViewController.blackWidowButton.transform = CGAffineTransform.identity
        menuViewController.captainAmericaButton.transform = CGAffineTransform.identity
        menuViewController.hulkButton.transform = CGAffineTransform.identity
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.pushing = false
        return self
    }
}
