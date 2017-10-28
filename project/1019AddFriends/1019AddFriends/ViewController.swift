

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet var tv: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  //여기서 해야 뷰가 나타나기전에 먼저 데이터가 셋팅 되고 뷰가 나타나는 순서가 됨
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    tv.reloadData()
    
  }
  //MARK : - UITableViewDataSource

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return DataCenter.mainCenter.nameList.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    let name = DataCenter.mainCenter.nameList[indexPath.row]
    cell.textLabel?.text = name
    return cell
  }
}

