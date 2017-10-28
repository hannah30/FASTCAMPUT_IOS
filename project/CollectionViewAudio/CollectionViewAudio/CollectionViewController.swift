

import UIKit
import AVFoundation

class CollectionViewController: UIViewController {

  @IBOutlet weak var audioColloectionView: UICollectionView!
  @IBOutlet weak var titleNameLabel: UILabel!
  @IBOutlet weak var singerNameLabel: UILabel!
  
  @IBOutlet weak var musicProgress: UIProgressView!
  @IBOutlet weak var currentPlayTimeLabel: UILabel!
  @IBOutlet weak var durationPlayTimeBtn: UILabel!
  
  lazy var songData : MainManager = MainManager()
  
  var player: AVAudioPlayer?
 
  var currentIndex : Int = 0 {
    willSet{
      let selectedData = songData.audioManager[newValue]
      self.titleNameLabel.text = selectedData.title
      self.singerNameLabel.text = selectedData.singer
    }
  }
 
  
  
//  var imgList: [UIImage] = []
  
  override func viewDidLoad() {
        super.viewDidLoad()

    audioColloectionView.isPagingEnabled = true
//    let selectedData = songData.audioManager[currentIndex]
    self.titleNameLabel.text = songData.audioManager[0].title
    self.singerNameLabel.text = songData.audioManager[0].singer

  }
  @IBAction func didTabPlayBtn(_ sender: UIButton) {
    
    sender.isSelected = !sender.isSelected

//    let selected = sender.isSelected
//    let deselected = !sender.isSelected
    
    if sender.isSelected {
      let visibleCell = audioColloectionView.visibleCells.first!
      let indexPathOfVisibleCell = audioColloectionView.indexPath(for: visibleCell)!
      titleNameLabel.text = songData.audioManager[indexPathOfVisibleCell.item].title
      singerNameLabel.text = songData.audioManager[indexPathOfVisibleCell.item].singer
      
      player = try! AVAudioPlayer(contentsOf: songData.audioManager[indexPathOfVisibleCell.item].url!)
      player?.play()
      
//      let secondPlayTime = String(format: "%.1f", player!.duration)
      currentPlayTimeLabel.text = "\(String(player!.currentTime))"
      durationPlayTimeBtn.text = "\(String(format: "%.1f", player!.duration))"
//      Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: <#T##Selector#>, userInfo: <#T##Any?#>, repeats: true)
      
    } else {
      player?.pause()
    }
    
  }
  
  @IBAction func didTabPreBtn(_ sender: UIButton) {
    if !(currentIndex == 0) {
      currentIndex + 1
    }
  }
  
  @IBAction func didTabNextBtn(_ sender: UIButton) {
    
  }
  
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

func progressStart() {

  
}

extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return songData.audioManager.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCover", for: indexPath) as! CustomCollectionViewCell
    cell.titleImg.image = songData.audioManager[indexPath.item].titleImg
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize(width:collectionView.bounds.size.width * 0.8, height: collectionView.bounds.size.height * 0.8)
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    
    let sideInset = (collectionView.bounds.size.width - (collectionView.bounds.size.width * 0.8)) / 2
    
    return UIEdgeInsets(top: 0, left:sideInset , bottom: 0, right: sideInset)
  }
  
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    let lineSpacing = collectionView.bounds.size.width * 0.2
    return lineSpacing
  }

}

//extension CollectionViewController : UIScrollViewDelegate {
//  public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//    let pageIndex = Int(targetContentOffset.pointee.x / scrollView.bounds.size.width)
//    currentIndex = pageIndex
//  }
//}

