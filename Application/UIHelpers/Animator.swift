//
//  Animator.swift
//  WeatherApp
//
//  Created by Olga on 13.08.2021.
//

import UIKit


class Aniamtor: NSObject, UIViewControllerAnimatedTransitioning {
    /// Время перехода
    private let animationDuration: TimeInterval = 0.5
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        
        source.view.frame = transitionContext.containerView.frame
        destination.view.frame = transitionContext.containerView.frame
        
        destination.view.transform = CGAffineTransform(translationX: 0, y: -source.view.bounds.height)
        
        UIView.animate(withDuration: animationDuration) {
            destination.view.transform = .identity
        } completion: { completed in
            source.removeFromParent()
            transitionContext.completeTransition(completed)
        }
    }
    
    
}
