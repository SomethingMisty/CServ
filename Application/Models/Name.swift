//
//  Name.swift
//  Application
//
//  Created by Alex Gikaev on 29.07.2021.
//

import UIKit


struct Friends {
    let name: String
    let image: UIImage?
}

// для FriendTableView
//extension Friends {
//    static let allFriends =
//        [Friends(name: "Роман Демидов", image: UIImage(named: "Roma")),
//         Friends(name: "Кирилл Орлов", image: UIImage(named: "Kirill")),
//         Friends(name: "Клим Беларусов", image: UIImage(named: "Klim")),
//         Friends(name: "Ксюша Корниенко", image: UIImage(named: "Ksusha")),
//         Friends(name: "Николай Люкшин", image: UIImage(named: "Kolya")),
//         Friends(name: "Георгий Алигафренович", image: UIImage(named: "Gosha"))]
//}
//
//// для AddFriendTableView
extension Friends {
    static let availableFriends =
        [Friends(name: "Анастасия Прокопьева", image: UIImage(named: "Nastya")),
         Friends(name: "Илья Корниенко", image: UIImage(named: "Ilya")),
         Friends(name: "Алексей Червонов", image: UIImage(named: "Alexey")),
         Friends(name: "Алена Косоурова", image: UIImage(named: "Alena"))]
}
