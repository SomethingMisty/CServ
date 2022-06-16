//
//  ShadowView.swift
//  Application
//
//  Created by Alex Gikaev on 01.08.2021.
//

import UIKit


@IBDesignable
class ShadowView: UIView {


    @IBInspectable var shadowColor: UIColor? {
        set {
            layer.shadowColor = newValue!.cgColor
        }
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor:color)
            }
            else {
                return nil
            }
        }
    }

    @IBInspectable var shadowOpacity: Float {
        set {
            layer.shadowOpacity = newValue
        }
        get {
            return layer.shadowOpacity
        }
    }

    @IBInspectable var shadowOffset: CGPoint {
        set {
            layer.shadowOffset = CGSize(width: newValue.x, height: newValue.y)
        }
        get {
            return CGPoint(x: layer.shadowOffset.width, y:layer.shadowOffset.height)
        }
    }

    @IBInspectable var shadowRadius: CGFloat {
        set {
            layer.shadowRadius = newValue
        }
        get {
            return layer.shadowRadius
        }
    }

}




// MARK: -  Моя попытка сделать через протокол
@IBDesignable
class AllCustomView: UIImageView, ShadowableRoundableView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.setNeedsLayout()
        }
    }

    @IBInspectable var shadowColor: UIColor = UIColor.darkGray {
        didSet {
            self.setNeedsLayout()
        }
    }

    @IBInspectable var shadowOffsetWidth: CGFloat = 3 {
        didSet {
            self.setNeedsLayout()
        }
    }


    @IBInspectable var shadowOffsetHeight: CGFloat = 3 {
        didSet {
            self.setNeedsLayout()
        }
    }


    @IBInspectable var shadowOpacity: Float = 0.4 {
        didSet {
            self.setNeedsLayout()
        }
    }


    @IBInspectable var shadowRadius: CGFloat = 4 {
        didSet {
            self.setNeedsLayout()
        }
    }

    private(set) lazy var shadowLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        self.layer.insertSublayer(layer, at: 1)
        self.setNeedsLayout()
        return layer
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.setCornerRadiusAndShadow()
    }
}
