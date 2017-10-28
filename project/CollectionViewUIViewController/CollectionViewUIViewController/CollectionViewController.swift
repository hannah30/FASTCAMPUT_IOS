//
//  CollectionViewController.swift
//  CollectionViewUIViewController
//
//  Created by okkoung on 2017. 10. 26..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

  let animals = ["lion", "tiger", "cat", "dog", "rabbit", "chiken", "mouse", "cow", "duck", "squal", "griffe"]

extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return animals.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimalCell", for: indexPath) as! AnimalCollectionViewCell
    
    cell.animalName.text = animals[indexPath.item]
    cell.backgroundColor = .red
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.size.width * 0.5, height: 100)
  }
  
  //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
  //        return collectionView.frame.size.height - 100
  //    }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    
    return collectionView.frame.size.width * 0.5
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    let sideInset = collectionView.frame.size.width * 0.25
    let tobInset = (collectionView.frame.size.height - 100)/2
    
    
    
    return UIEdgeInsets(top: tobInset, left: sideInset, bottom: tobInset, right: sideInset)
  }
}
