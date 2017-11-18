

import UIKit
import JTAppleCalendar

class ViewController: UIViewController {

  @IBOutlet weak var calendarView: JTAppleCalendarView!
  @IBOutlet weak var monthTextLabel: UILabel!
  @IBOutlet weak var yearTextLabel: UILabel!
  
  let outsideMonthColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
  let monthColor = UIColor.white
  let selectedMonthColor = UIColor.darkGray
  let currentDateSelecterColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
  
  let formatter = DateFormatter()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpCalendarView()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  func setUpCalendarView(){
    calendarView.minimumLineSpacing = 0
    calendarView.minimumInteritemSpacing = 0
    
    calendarView.visibleDates { (visibleDates) in
      self.setupViewOfCalendar(from: visibleDates)
    }
  }

  func handleCellTextColor(view: JTAppleCell?, cellstate: CellState){
    guard let validCell = view as? CustomCell else { return }
    if cellstate.isSelected {
      validCell.dateTextLabel.textColor = selectedMonthColor
    } else {
      if cellstate.dateBelongsTo == .thisMonth {
        validCell.dateTextLabel.textColor = monthColor
      } else {
        validCell.dateTextLabel.textColor = outsideMonthColor
      }
    }
  }
  func handleCellSelected(view: JTAppleCell?, cellstate: CellState){
    guard let validCell = view as? CustomCell else { return }
    if cellstate.isSelected {
      validCell.selectedView.isHidden = false
    } else {
      validCell.selectedView.isHidden = true
    }
  }
  
  func setupViewOfCalendar(from visibleDates: DateSegmentInfo){
    let date = visibleDates.monthDates.first!.date
    
    self.formatter.dateFormat = "yyyy"
    self.yearTextLabel.text = self.formatter.string(from: date)
    self.formatter.dateFormat = "M" + "월"
    self.monthTextLabel.text = self.formatter.string(from: date)
  }

  
}

extension ViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
  func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
    
  }
  
  func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
    let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
    cell.dateTextLabel.text = cellState.text
    handleCellSelected(view: cell, cellstate: cellState)
    handleCellTextColor(view: cell, cellstate: cellState)
    return cell
  }
  
  func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
    
    formatter.dateFormat = "yyyy MM dd"
    formatter.timeZone = Calendar.current.timeZone
    formatter.locale = Calendar.current.locale
    
    let startdate = formatter.date(from: "2017 01 01")!
    let enddate = Date()
    
    let parameters = ConfigurationParameters(startDate: startdate,
                                             endDate: enddate,
                                             numberOfRows: 6,
                                             calendar: Calendar.current,
                                             generateInDates: .forAllMonths,
                                             generateOutDates: .tillEndOfGrid,
                                             firstDayOfWeek: .sunday)
    
//    let parameters = ConfigurationParameters(startDate: startdate, endDate: enddate)
    return parameters
  }
  
  func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
    handleCellSelected(view: cell, cellstate: cellState)
    handleCellTextColor(view: cell, cellstate: cellState)
  }

  func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
    handleCellSelected(view: cell, cellstate: cellState)
    handleCellTextColor(view: cell, cellstate: cellState)
  }
  
  func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
    setupViewOfCalendar(from: visibleDates)
    
  }
}
