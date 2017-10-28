

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SwitchTableViewCellDelegate {
  
  
  var onOffList:[Bool] = [true, true, true,true, true, true, true, true, true, true, true, true]

  override func viewDidLoad() {
    super.viewDidLoad()

  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return onOffList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SwitchTableViewCell
    cell.delegate = self
    cell.textLabel?.text = "\(indexPath.row)"
    cell.switchData = onOffList[indexPath.row]
    cell.indexPath = indexPath
    return cell
  }

  func swtchTableViewCell(_ cell: SwitchTableViewCell, didChangedSwitch value: Bool) {
    print("change Switch \(cell.indexPath!.row)")
    
    onOffList[cell.indexPath!.row] = value
  }
}

