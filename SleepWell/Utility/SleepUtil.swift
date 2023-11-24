//
//  SleepUtil.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 25/10/23.
//

import Foundation

final class SleepUtil {
    static func getSleepCycle(param: Int) -> String {
        if param == 4 {
            return "4-cycle sleep ((4 x 90 mins))"
        }else if param == 5 {
            return "5-cycle sleep ((5 x 90 mins))"
        }
        else if param == 6 {
            return "6-cycle sleep ((6 x 90 mins))"
        }
        else {
            return "Invalid sleep cycle"
        }
    }
    
    static func combineTimeWithToday(time: Date) -> Date? {
        let calendar = Calendar.current
        
        // Get the date components from the current date
        let todayComponents = calendar.dateComponents([.year, .month, .day], from: Date())
        
        // Get the time components from the 'time' date
        let timeComponents = calendar.dateComponents([.hour, .minute, .second], from: time)
        
        // Combine the date components from today with the time components
        let combinedDate = calendar.date(bySettingHour: timeComponents.hour ?? 0,
                                         minute: timeComponents.minute ?? 0,
                                         second: timeComponents.second ?? 0,
                                         of: calendar.date(from: todayComponents)!)
        
        return combinedDate
    }
    
    static func calculatePercentageSleep(yourSleep: TimeInterval, sleepTime: TimeInterval) -> Double {
        if sleepTime <= 0 {
            return 0.0 // To avoid division by zero
        }
        
        let percentage = (yourSleep / sleepTime) * 100.0
        return min(100.0, percentage) // Ensure the result is within [0, 100]
    }

}
