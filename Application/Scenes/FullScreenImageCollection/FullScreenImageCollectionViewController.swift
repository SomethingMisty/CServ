//
//  FullScreenImageCollectionViewController.swift
//  Application
//
//  Created by Alex Gikaev on 29.07.2021.
//
import Foundation
import UIKit


class FullScreenImageCollectionViewController: UICollectionViewController {
    
    
   
   // MARK: - Свойства
    var currentPhoto: UIImage!
    
    /// для анимации
    private var isLiked = false
    private let likedImage = UIImage(systemName: "heart.fill")
    private let unlikedImage = UIImage(systemName: "heart")
    private let unlikedScale: CGFloat = 0.7
    private let likedScale: CGFloat = 1.3
    private let likedTitle = "1"
    private let unlikedTitle = "0"
    
    /// ID
    private var reuseID = "FullScreenImageCollectionViewCell"
    
    
    // MARK: - Функциии
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseID, for: indexPath) as? FullScreenImageCollectionViewCell else {
            fatalError("{Message: Error in dequeue FriendTableViewCell}")
        }
        cell.likeButtonOutlet.setImage(unlikedImage, for: .normal)
        cell.likeButtonOutlet.setTitle("0", for: .normal)
        cell.likeButtonOutlet.addTarget(self, action: #selector(tapLikeChanger(_:)), for: .touchUpInside)

        cell.imageFull.image = currentPhoto
        return cell
    }
    
    /// функция обрабатывающая нажатие
    @objc func tapLikeChanger(_ sender: UIButton){
        /// анимация
        isLiked = !isLiked
        UIButton.animate(withDuration: 0.2, animations: {
            let newImage = self.isLiked ? self.likedImage : self.unlikedImage
            let newScale = self.isLiked ? self.likedScale : self.unlikedScale
            let newTitle = self.isLiked ? self.likedTitle : self.unlikedTitle
            sender.transform = sender.transform.scaledBy(x: newScale, y: newScale)
            sender.setImage(newImage, for: .normal)
            sender.setTitle(newTitle, for: .normal)
        }, completion: { _ in
            UIButton.animate(withDuration: 0.2, animations: {
                sender.transform = CGAffineTransform.identity
            })
        })
    }
}


