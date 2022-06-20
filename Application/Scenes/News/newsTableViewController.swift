//
//  newsTableViewController.swift
//  Application
//
//  Created by Alex Gikaev on 09.08.2021.
//

import UIKit

class newsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
  
    
    
    // MARK: - Аутлеты
    
    @IBOutlet weak var newsTableView: UITableView!
    
    @IBOutlet weak var parallaxImageNews: UIImageView!
    
    @IBOutlet weak var parallaxImageHeightConstraint: NSLayoutConstraint!
    
    
    
    
    // MARK: - Свойства
    
    private let contentCellID: String = "contentCellID"
    private let emptyCellID: String = "emptyCellID"
    private let errorCellID: String = "errorCellID"
    var initialImageHeight : CGFloat = 0
    
    
    
    // MARK: - Жизненный цикл
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialiseViews()
        setupTableView()
    }
    
    
    // MARK: - Функции
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "newCell" , for: indexPath) as? NewsTableViewCell else {
            fatalError("{Message: Error in dequeue GroupsTableViewController}")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    

    
    
    private func initialiseViews() {
        parallaxImageNews.image = UIImage(named: "shrek")
        initialImageHeight = parallaxImageHeightConstraint.constant
    }
    
    private func setupTableView() {
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.register(UITableViewCell.self, forCellReuseIdentifier: contentCellID)
        newsTableView.register(UITableViewCell.self, forCellReuseIdentifier: emptyCellID)
        newsTableView.register(UITableViewCell.self, forCellReuseIdentifier: errorCellID)
    }
}

