//
//  ViewController.swift
//  collectionviewadd
//
//  Created by okkoung on 2017. 10. 27..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var pinkCollectionView: UICollectionView!
  var objectList: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o" ]
  
  @IBAction func addBtn(_ sender: Any) {
    
    pinkCollectionView.performBatchUpdates({
      let index = IndexPath(item: 3, section: 0)
//      objectList.insert("h", at: 3)
      objectList.append("h")
      pinkCollectionView.insertItems(at: [index])
      
    }, completion: nil)
  }
  
  @IBAction func deleteBtn(_ sender: Any) {
    if objectList.count > 0 {
      pinkCollectionView.performBatchUpdates({
        let index = IndexPath(item: 0, section: 0)
        objectList.removeFirst()
        pinkCollectionView.deleteItems(at: [index])
      }, completion: nil)
    }
    
  }

  
  override func viewDidLoad() {
    super.viewDidLoad()
   
    
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return objectList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
    cell.textLabel.text = objectList[indexPath.row]
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = (collectionView.frame.size.width / 4 ) - 3
    return CGSize(width: width, height: width)
  }
  
//  func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//    objectList.remove(at: <#T##Int#>)
//    return true
//  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deleteItems(at: <#T##[IndexPath]#>)
    let cell = collectionView.cellForItem(at: indexPath)
    cell?.layer.borderColor = UIColor.red.cgColor
    
  }


  
}
