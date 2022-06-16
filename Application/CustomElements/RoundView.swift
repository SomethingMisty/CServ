//
//  RoundView.swift
//  Application
//
//  Created by Alex Gikaev on 01.08.2021.
//

import UIKit

@IBDesignable
class RoundImageView: UIImageView {

    private var round = false


    @IBInspectable var inspectRound: Bool {
        set {
            round = newValue
            makeRound()
        }
        get {
            return self.round
        }
    }

    override internal var frame: CGRect{
        set {
            super.frame = newValue
            makeRound()
        }
        get {
            return super.frame
        }
    }

    private func makeRound() {
        if self.round {
            self.clipsToBounds = true
            self.layer.cornerRadius = (self.frame.width + self.frame.height) / 4
        } else {
            self.layer.cornerRadius = 0
        }
    }

}
