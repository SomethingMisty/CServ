//
//  FriendsTableViewController.swift
//  Application
//
//  Created by Alex Gikaev on 29.07.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        firstCharacters.count
        
    }
    // MARK: - Аутлеты
    
    @IBOutlet private var friendsTableView: UITableView!
    
    @IBOutlet var imageParallax: UIImageView!
    
    
    
    // MARK: - Свойства
    
    private struct FriendsConstants {
        /// идентификатор для ячейки
        static let cellID = "FriendTableViewCell"
    }
    /// массив с человеками
    var people = [Friends(name: "Роман Демидов", image: UIImage(named: "Roma")),
                  Friends(name: "Кирилл Орлов", image: UIImage(named: "Kirill")),
                  Friends(name: "Клим Беларусов", image: UIImage(named: "Klim")),
                  Friends(name: "Ксюша Корниенко", image: UIImage(named: "Ksusha")),
                  Friends(name: "Николай Люкшин", image: UIImage(named: "Kolya")),
                  Friends(name: "Георгий Алигафренович", image: UIImage(named: "Gosha"))]
    
    
    
    /// первые буквы друзей
    var firstCharacters = [Character]()
    
    /// словарь отсортированных имен
    var sortedFriends: [Character : [Friends]] = [:]
    
    // MARK: - Жизненный цикл
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (firstCharacters, sortedFriends) = sort(people)
    }
    
    // MARK: - Методы(функции)
    
    func sort(_ friends: [Friends]) -> (characters: [Character], sortedFriends : [Character : [Friends]]) {
        /// список первых букв
        var characters = [Character]()
        /// отсортированные друзья
        var sortedFriends = [Character : [Friends]]()
        
        /// проходимся по всем друзьям
        people.forEach { people in
            /// вычисляем первую букву
            guard let character = people.name.first else { return }
            ///  если значение на букву
            if var thisCharFriends = sortedFriends[character] {
                
                /// то мы должны добавить нового друга и
                thisCharFriends.append(people)
                /// переприсвоить значение в словаре по текущей букве
                sortedFriends[character] = thisCharFriends
            } else {
                sortedFriends[character] = [people]
                characters.append(character)
            }
        }
        characters.sort()
        return(characters, sortedFriends)
    }
    
    
    /// выход и добавление выбранного друга
    @IBAction func goBackFromAvaliableFriends(with segue: UIStoryboardSegue) {
        guard let avaliableVC = segue.source as? AddFriendTableViewController,
              let indexPath = avaliableVC.tableView.indexPathForSelectedRow else { return }
        let newFriend = avaliableVC.people[indexPath.row]/// в newfriend передается нажатая ячейка
        
        guard !people.contains(where: { $0.name == newFriend.name}) else {return}
             

        people.append(newFriend)
        friendsTableView.reloadData()
    }
  
    /// возвращает количество заполненных ячеек
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let character = firstCharacters[section]
        let friendsCount = sortedFriends[character]?.count
        
        return friendsCount ?? 0
    }
    /// воводит информацию в ячейки
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsConstants.cellID,
                                                    for: indexPath) as? FriendTableViewCell else {
            fatalError("{Message: Error in dequeue FriendTableViewCell}")
        }
        let character = firstCharacters[indexPath.section]
        guard let people = sortedFriends[character] else {return UITableViewCell() }
        cell.friendImage.image = people[indexPath.row].image
        cell.friendName.text = people[indexPath.row].name
        return cell
    }
    
    // функция удаления свайпом влево
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            let deletedFriend = people[indexPath.row]
            people.remove(at: indexPath.row)
            print(deletedFriend.name)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            return
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
}
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(firstCharacters[section])
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        // цвет заднего фона
        view.tintColor = UIColor.white
        
        /// цвет текста
        let headerView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = UIColor.black
    }
    
    
    // MARK: - Segue
    
    
    /// Отправляет данные с нажатой ячейки в collectionview 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pushImage" {
            let cell: FriendTableViewCell = sender as! FriendTableViewCell
            let image = cell.friendImage.image
            let previewVC: FullScreenImageCollectionViewController = segue.destination as! FullScreenImageCollectionViewController
            
            previewVC.currentPhoto = image
        }
    }
}
