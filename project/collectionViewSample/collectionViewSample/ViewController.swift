

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var layout: UICollectionViewFlowLayout!
  
  @IBOutlet weak var sampleCollection: UICollectionView!
  
  
  override func viewDidLoad() {

    super.viewDidLoad()
    
    //상단 header 고정시키는 것
    
    layout.sectionHeadersPinToVisibleBounds = true
  }

  //플러스 사이즈가 적용이 viewdidload에서는 아직 autolayout이 먹기 전이므로 꼭 viewdidlayoutsubviews에서 해야한다
  //사이즈 관련은 꼭 여기서 하는게 좋다
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    let width = self.sampleCollection.frame.size.width / 3
    layout.itemSize = CGSize(width: width, height: width)
    
  }
  

}

extension ViewController : UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 4
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    cell.contentView.backgroundColor = .blue
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
    return headerView
  }
  
}
//셀마다 사이즈를 다르게 할때 이걸 쓰는게 좋다 아님 위에 바로 한것처럼 하는게 편하다
extension ViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.frame.size.width / 3
    return CGSize(width: width, height: width)
  }
}






