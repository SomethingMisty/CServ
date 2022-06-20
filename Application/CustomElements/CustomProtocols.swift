//
//  CustomProtocols.swift
//  Application
//
//  Created by Alex Gikaev on 03.08.2021.
//

import Foundation
import UIKit

protocol ShadowableRoundableView {
    
    var cornerRadius: CGFloat { get set }
    var shadowColor: UIColor { get set }
    var shadowOffsetWidth: CGFloat { get set }
    var shadowOffsetHeight: CGFloat { get set }
    var shadowOpacity: Float { get set }
    var shadowRadius: CGFloat { get set }
    
    var shadowLayer: CAShapeLayer { get }
    
    func setCornerRadiusAndShadow()
}

extension ShadowableRoundableView where Self: UIView {
    func setCornerRadiusAndShadow() {
        layer.cornerRadius = cornerRadius
        shadowLayer.path = UIBezierPath(roundedRect: bounds,
                                            cornerRadius: cornerRadius ).cgPath
        shadowLayer.fillColor = backgroundColor?.cgColor
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: shadowOffsetWidth ,
                                          height: shadowOffsetHeight )
        shadowLayer.shadowOpacity = shadowOpacity
        shadowLayer.shadowRadius = shadowRadius
    }
}
