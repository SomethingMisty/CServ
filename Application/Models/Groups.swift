//
//  Groups.swift
//  Application
//
//  Created by Alex Gikaev on 29.07.2021.
//

import UIKit


struct Group {
    let name: String
    let image: UIImage?
}

extension Group {
    static let allGroups = [Group(name: "SUV", image: UIImage(named: "SUV")),
                            Group(name: "Театрзакрыт", image: UIImage(named: "teatr")),
                            Group(name: "reddit", image: UIImage(named: "Reddit")),
                            Group(name: "why", image: UIImage(named: "Why"))]
    
}
