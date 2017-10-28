

import UIKit

class SwitchTableViewCell: UITableViewCell {
  @IBOutlet var sw: UISwitch!
  
  var indexPath: IndexPath?
  var delegate: SwitchTableViewCellDelegate?
  var switchData: Bool = true {
    willSet {
      self.sw.isOn = newValue
    }
  }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

  @IBAction func switchValueChanged(_ sender: UISwitch) {
    print(sender.isOn, "\(indexPath!.row)")
    delegate?.swtchTableViewCell(self, didChangedSwitch: sender.isOn)
  }
}

protocol SwitchTableViewCellDelegate {
  func swtchTableViewCell(_ cell: SwitchTableViewCell, didChangedSwitch value: Bool)
}






