
import UIKit
protocol MonthViewDelegate: class {
  func didChangeMonth(monthIndex: Int, year: Int)
}

class MonthView: UIView {
  
  var monthsList = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월","9월", "10월", "11월", "12월"]
  var currentMonthIndex = 0
  var currentYear = 0
  var delegate: MonthViewDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundColor = UIColor.clear
    currentMonthIndex = Calendar.current.component(.month, from: Date()) - 1
    currentYear = Calendar.current.component(.year, from: Date())
    
    setupView()
    
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
