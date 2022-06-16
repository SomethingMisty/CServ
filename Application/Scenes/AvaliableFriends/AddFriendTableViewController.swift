//
//  AddFriendTableViewController.swift
//  Application
//
//  Created by Alex Gikaev on 29.07.2021.
//

import UIKit

class AddFriendTableViewController: UITableViewController {

    // MARK: - Аутлеты
    
    @IBOutlet var FriendAddTableView: UITableView!
    // MARK: - Свойства
    private let avaliableID = "FriendTableViewCell"
    /// массив с доступными друзьяшками
    var people = Friends.availableFriends

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: avaliableID, for: indexPath) as? FriendTableViewCell else {
            fatalError("{Message: Error in dequeue FriendTableViewCell}")
        }
        cell.friendImage.image = people[indexPath.row].image
        cell.friendName.text = people[indexPath.row].name
        return cell
    }
    
    
}

