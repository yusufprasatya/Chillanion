//
//  DateUtil.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 25/10/23.
//

import Foundation

final class DateUtil {
    static func calculateTimes(from inputTime: Date, cycle: Int) -> Date {
        var calendar = Calendar.current
        
        if cycle == 4 {
            var dateComponent6Hours = DateComponents()
            dateComponent6Hours.hour = -6
            let sixHoursLater = calendar.date(byAdding: dateComponent6Hours, to: inputTime)!
            return sixHoursLater
        }
        
        if cycle == 5 {
            var dateComponent7_5Hours = DateComponents()
            dateComponent7_5Hours.hour = -7
            dateComponent7_5Hours.minute = 30
            let sevenPointFiveHoursLater = calendar.date(byAdding: dateComponent7_5Hours, to: inputTime)!
            return sevenPointFiveHoursLater
        }
        
        if cycle == 6 {
            // Calculate 9 hours from the input time
            var dateComponent9Hours = DateComponents()
            dateComponent9Hours.hour = -9
            let nineHoursLater = calendar.date(byAdding: dateComponent9Hours, to: inputTime)!
            return nineHoursLater
        }
        
        return Date()
    }
    
    static func formatDateToString(param: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: param)
    }
}
