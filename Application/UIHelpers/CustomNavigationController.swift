//
//  CustomNavigationController.swift
//  WeatherApp
//
//  Created by Olga on 13.08.2021.
//

import UIKit

class CustomInterectiveTransition: UIPercentDrivenInteractiveTransition {
    var hasStarted = false
    var shouldFinish = false
    var viewController: UIViewController? {
        didSet {
            let panGR = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handle(_:)))
            panGR.edges = .left
            
            viewController?.view.addGestureRecognizer(panGR)
        }
    }
    
    @objc private func handle(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            self.hasStarted = true
            self.viewController?.navigationController?.popViewController(animated: true)
        case .changed:
            let translation = recognizer.translation(in: recognizer.view)
            let relativeTranslation = translation.x / (recognizer.view?.bounds.width ?? 1)
            let progress = max(0, min(1, relativeTranslation))
            
            shouldFinish = progress > 0.33
            
            update(progress)
        case .ended:
            hasStarted = false
            shouldFinish ? finish() : cancel()
        case .cancelled:
            hasStarted = false
            cancel()
        default: return
        }
    }
}



class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {
    let interacriveTransition = CustomInterectiveTransition()

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    
    }
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .pop:
            if navigationController.viewControllers.first != toVC {
                self.interacriveTransition.viewController = toVC
            }
            return PopAnimator()
        case .push:
            self.interacriveTransition.viewController = toVC
            return PushAnimator()
        default:
            return nil
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        interacriveTransition.hasStarted ? interacriveTransition : nil
    }
    
}


