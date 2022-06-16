//
//  GroupsTableViewController.swift
//  Application
//
//  Created by Alex Gikaev on 29.07.2021.
//

import UIKit

class GroupsTableViewController: UITableViewController, UISearchBarDelegate {
    

    // MARK: - Аутлеты
    
    @IBOutlet var groupTableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    
    // MARK: - Свойства
    
    /// закладываем массив с группами в переменную
    var group = Group.allGroups
    var filteredData = Group.allGroups
    
    /// метод добавления и выхода из TableView доступных групп
    @IBAction func goBackFromAvaliableFriends(with segue: UIStoryboardSegue) {
        guard let avaliableVC = segue.source as? AvaliableGroupsTableViewController,
              let indexPath = avaliableVC.tableView.indexPathForSelectedRow else { return }
        let newGroup = avaliableVC.group[indexPath.row]
        
        guard !filteredData.contains(where: { $0.name == newGroup.name}) else {return}
             

        group.append(newGroup)
        filteredData.append(newGroup)
        groupTableView.reloadData()
            
    }
    // MARK: -  Константы
    
    /// структура куда мы закидываем константы
    private struct GroupConstants {
        static let cellID = "GroupTableViewCell"
    }
    // MARK: - Жизненный цикл
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        filteredData = group
        
    }
    
    
    
    // MARK: - Функции
    
    /// возвращает количество заполненных ячеек
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    /// воводит информацию в ячейки
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupConstants.cellID, for: indexPath) as? GroupTableViewCell else {
            fatalError("{Message: Error in dequeue GroupsTableViewController}")
        }
        cell.imageGroup.image = filteredData[indexPath.row].image
        cell.nameGroup.text = filteredData[indexPath.row].name
        
        return cell
    }
    
    /// функция удаления свайпом влево
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            let deletedFriend = filteredData[indexPath.row]
            filteredData.remove(at: indexPath.row)
            let deletedFriendFor2 = group[indexPath.row]
            group.remove(at: indexPath.row)
            print(deletedFriend.name)
            print(deletedFriendFor2.name)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            return
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    // MARK: - SearchBar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        /// отчищаем наш массив для его фильтрации
        filteredData = []
        
        if searchText == "" {filteredData = group}
        else {
            for groups in group {
                
                if groups.name.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(groups)
                }
            }
        }
        self.tableView.reloadData()
    }
}


