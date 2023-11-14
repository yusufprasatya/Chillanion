//
//  Extension+Calender.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 06/11/23.
//

import SwiftUI
import Foundation
import FSCalendar

extension CalendarView {
    enum CalendarMode {
        case basicCalendarMode
    }
}

extension CalendarView.Coordinator: FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("selected")
    }
}

extension CalendarView.Coordinator: FSCalendarDelegateAppearance {
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance,
                  fillDefaultColorFor date: Date) -> UIColor? {
        var dateFormatter: DateFormatter {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter
        }
        let eventDate = dateFormatter.string(from: date)
        return reservedDates.contains(where: { $0 == eventDate }) ? UIColor(named: "Primary") : nil
    }
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance,
                  titleDefaultColorFor date: Date) -> UIColor? {
        var dateFormatter: DateFormatter {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter
        }
        let eventDate = dateFormatter.string(from: date)
        return reservedDates.contains(where: { $0 == eventDate }) ? .white: .black
    }
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance,
                  fillSelectionColorFor date: Date) -> UIColor? { return UIColor.white
    }
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance,
                  titleSelectionColorFor date: Date) -> UIColor? { return .black
    }
}
