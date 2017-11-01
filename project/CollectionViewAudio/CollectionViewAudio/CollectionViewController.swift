

import UIKit
import AVFoundation

class CollectionViewController: UIViewController {

  @IBOutlet weak var audioColloectionView: UICollectionView!
  @IBOutlet weak var titleNameLabel: UILabel!
  @IBOutlet weak var singerNameLabel: UILabel!
  
  @IBOutlet weak var musicProgress: UIProgressView!
  @IBOutlet weak var currentPlayTimeLabel: UILabel!
  @IBOutlet weak var durationPlayTimeBtn: UILabel!
 
  @IBOutlet weak var playBtn: UIButton!
  
  
  lazy var songData : MusicDataManager = MusicDataManager()
  
  var player: AVPlayer = AVPlayer()
 
  var currentIndex : Int = 0 {
    willSet{
      let selectedData = songData.songDatas[newValue]
      self.titleNameLabel.text = selectedData.title
      self.singerNameLabel.text = selectedData.artistName
    }
  }
 
  
  
//  var imgList: [UIImage] = []
  
  override func viewDidLoad() {
        super.viewDidLoad()

//gesture
    let gesture = UIGestureRecognizer(target: self, action: #selector(self.tapOnAlbumCover(_:)))
    audioColloectionView.addGestureRecognizer(gesture)
    
    audioColloectionView.isPagingEnabled = true
//    let selectedData = songData.audioManager[currentIndex]
    
    titleNameLabel.text = songData.songDatas[0].title
    singerNameLabel.text = songData.songDatas[0].artistName

  }

  @IBAction func didTabPlayButton(_ sender: UIButton) {
//    sender.isSelected = !sender.isSelected
    
    //    let selected = sender.isSelected
    //    let deselected = !sender.isSelected
    
//    if sender.isSelected {
      let visibleCell = audioColloectionView.visibleCells.first!
      let indexPathOfVisibleCell = audioColloectionView.indexPath(for: visibleCell)!
      titleNameLabel.text = songData.songDatas[indexPathOfVisibleCell.item].title
      singerNameLabel.text = songData.songDatas[indexPathOfVisibleCell.item].artistName
      
      let selectedData = songData.songDatas[currentIndex]
    if let urlPath = Bundle.main.url(forResource: selectedData.songUrl, withExtension: "mp3")
    {
      let asset = AVAsset(url: urlPath)
      let playerItem = AVPlayerItem(asset: asset, automaticallyLoadedAssetKeys: nil)
      player.replaceCurrentItem(with: playerItem)
      player.play()
    }
        
//      }
      
      //      let secondPlayTime = String(format: "%.1f", player!.duration)
      //      currentPlayTimeLabel.text = "\(String(player!.currentTime))"
      //      durationPlayTimeBtn.text = "\(String(format: "%.1f", player!.duration))"
      //      Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: <#T##Selector#>, userInfo: <#T##Any?#>, repeats: true)
      
//    } else {
//      player.pause()
//    }
        
//
    
  
  }

//  @IBAction func didTabLongPress(_ sender: Any) {
//    let stopBtn = UIImage(named: "btn_del")
//    playBtn.setImage(stopBtn, for: .normal)
//    player.rate = 0.0
//    player.pause()
//  }

  @objc func tapOnAlbumCover(_ sender: UIGestureRecognizer) {
    let lyricsView = UIView()
    lyricsView.frame = CGRect(x: 0, y: 20, width: audioColloectionView.frame.size.width, height: audioColloectionView.frame.size.height)
    lyricsView.backgroundColor = UIColor.lightGray
    lyricsView.alpha = 0.7
    audioColloectionView.addSubview(lyricsView)
  }

  
  @IBAction func didTabPreBtn(_ sender: UIButton) {
    if currentIndex != 0 {
      currentIndex -= 1
      let selectedData = songData.songDatas[currentIndex]
      if let urlPath = Bundle.main.url(forResource: selectedData.songUrl, withExtension: "mp3")
      {
        let asset = AVAsset(url: urlPath)
        let playerItem = AVPlayerItem(asset: asset, automaticallyLoadedAssetKeys: nil)
        player.replaceCurrentItem(with: playerItem)
        player.play()
      }
    }

  }
  
  @IBAction func didTabNextBtn(_ sender: UIButton) {
    currentIndex += 1
    let selectedData = songData.songDatas[currentIndex]
    if let urlPath = Bundle.main.url(forResource: selectedData.songUrl, withExtension: "mp3")
    {
      let asset = AVAsset(url: urlPath)
      let playerItem = AVPlayerItem(asset: asset, automaticallyLoadedAssetKeys: nil)
      player.replaceCurrentItem(with: playerItem)
      player.play()
    }
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
    return songData.songDatas.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCover", for: indexPath) as! CustomCollectionViewCell
    cell.titleImg.image = songData.songDatas[indexPath.item].artworkImg
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

