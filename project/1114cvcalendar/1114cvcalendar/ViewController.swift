

import UIKit
import CVCalendar

class ViewController: UIViewController, CVCalendarViewDelegate, CVCalendarMenuViewDelegate {
  func presentationMode() -> CalendarMode {
    return CalendarMode.monthView
  }
  
  func firstWeekday() -> Weekday {
    return Weekday.sunday
  }
  

  @IBOutlet weak var menuView: CVCalendarMenuView!
  @IBOutlet weak var calendarView: CVCalendarView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    
    // Appearance delegate [Unnecessary]
    self.calendarView.calendarAppearanceDelegate = self
    
    // Animator delegate [Unnecessary]
    self.calendarView.animatorDelegate = self
    
    // Menu delegate [Required]
    self.menuView.menuViewDelegate = self
    
    // Calendar delegate [Required]
    self.calendarView.calendarDelegate = self
    
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    // Commit frames' updates
    self.menuView.commitMenuViewUpdate()
    self.calendarView.commitCalendarViewUpdate()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

