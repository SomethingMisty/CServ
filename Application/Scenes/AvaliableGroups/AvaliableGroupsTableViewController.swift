//
//  AvaliableGroupsTableViewController.swift
//  Application
//
//  Created by Alex Gikaev on 29.07.2021.
//

import UIKit

class AvaliableGroupsTableViewController: UITableViewController {

    private let cellID = "AvaliableGroupTableViewCell"
    
    var group = [Group(name: "NoNameClub", image: UIImage(named: "NNM")),
                 Group(name: "xxxtentacion", image: UIImage(named: "xxxtentacion")),
                 Group(name: "Че", image: UIImage(named: "Che")),
                 Group(name: "Топор", image: UIImage(named: "Topor"))]
    
    /// возвращает количество заполненных ячеек
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return group.count
    }
    /// воводит информацию в ячейки
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? GroupTableViewCell else {
            fatalError("{Message: Error in dequeue GroupsTableViewController}")
        }
        cell.imageGroup.image = group[indexPath.row].image
        cell.nameGroup.text = group[indexPath.row].name
        return cell
    }

}
