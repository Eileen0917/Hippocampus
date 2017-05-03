
//
//  calendarViewController.swift
//  Hippocampus
//
//  Created by Eileen on 2017/5/2.
//  Copyright © 2017年 Eileen. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarViewController: UIViewController {
    
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var month: UILabel!
    
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
        
        //set up label spacing
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        
        calendarView.visibleDates{ visibileDates in
            self.setUpViewOfCalendar(from: visibileDates)
        }
    }
    
    func handleCellSelected(view: JTAppleCell?, cellState: CellState){
        guard let vaildCell = view as? CalendarCell else { return }
        
        if vaildCell.isSelected {
            vaildCell.selectedView.isHidden = false
        }
        else {
            vaildCell.selectedView.isHidden = true
        }

    }
    
    func handleCellTextColor(view: JTAppleCell?, cellState: CellState){
        
        guard let vaildCell = view as? CalendarCell else { return }
        
        if cellState.isSelected {
            vaildCell.dateLabel.textColor = UIColor.brown
        }
            
        else {
            if cellState.dateBelongsTo ==  .thisMonth {
                vaildCell.dateLabel.textColor = UIColor.black
            }
            else{
                vaildCell.dateLabel.textColor = UIColor.lightGray
            }
        }

        
    }
    
    
    func setUpViewOfCalendar(from visibleDates: DateSegmentInfo){
        
        let date = visibleDates.monthDates.first!.date
        
        formatter.dateFormat = "yyyy"
        year.text = formatter.string(from: date)
        
        formatter.dateFormat = "MMMM"
        month.text = formatter.string(from: date)
        
    }


}



extension CalendarViewController: JTAppleCalendarViewDataSource{
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2017-01-01")!
        let endDate = formatter.date(from: "2017-12-31")!
        
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        
        return parameters
    }
}



extension CalendarViewController: JTAppleCalendarViewDelegate {
    
    
    //Display the cell
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        cell.dateLabel.text = cellState.text
        
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
        
        return cell
    }

    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)

    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)

    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
       
        setUpViewOfCalendar(from: visibleDates)

    }
    
    
}



