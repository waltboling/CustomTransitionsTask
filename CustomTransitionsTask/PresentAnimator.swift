//
//  PresentAnimator.swift
//  CustomTransitionsTask
//
//  Created by Jon Boling on 6/26/18.
//  Copyright © 2018 Walt Boling. All rights reserved.
//

import UIKit

class PresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else {
            return
        }
        
        toViewController.view.alpha = 0
        transitionContext.containerView.addSubview(toViewController.view)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toViewController.view.alpha = 1
        }, completion: {
            completed in
            transitionContext.completeTransition(true)
        })
    }
}
