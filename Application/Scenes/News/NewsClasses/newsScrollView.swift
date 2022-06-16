//
//  newsScrollView.swift
//  Application
//
//  Created by Alex Gikaev on 10.08.2021.
//

import Foundation
import UIKit


extension newsViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentY = scrollView.contentOffset.y
        let height = initialImageHeight - contentY
        parallaxImageHeightConstraint.constant = height
    }
    
}



