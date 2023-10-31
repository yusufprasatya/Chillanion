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
            dateComponent6Hours.hour = -7
            let sixHoursLater = calendar.date(byAdding: dateComponent6Hours, to: inputTime)!
            return sixHoursLater
        }
        
        if cycle == 5 {
            var dateComponent7_5Hours = DateComponents()
            dateComponent7_5Hours.hour = -8
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
    
    static func formatDoubleToString(param: Double) -> String {
        let noDecimal = Int(floor(param))
        // convert to string
        let string = String(noDecimal)
        return string
    }
    
    static func humanReadableHour (data: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: data)!
    }
    
    static func extractNumbers(from input: String) -> (hours: Int, minutes: Int) {
        do {
            let regex = try NSRegularExpression(pattern: "(\\d+)h( (\\d+)m)?", options: [])
            if let match = regex.firstMatch(in: input, options: [], range: NSRange(input.startIndex..., in: input)) {
                let hoursRange = Range(match.range(at: 1), in: input)
                if let hoursRange = hoursRange, let hours = Int(input[hoursRange]) {
                    if let minutesRange = Range(match.range(at: 3), in: input), let minutes = Int(input[minutesRange]) {
                        return (hours, minutes)
                    } else {
                        return (hours, 0) // If no minutes are specified, assume 0 minutes.
                    }
                }
            }
        } catch {
            print("Error: \(error)")
        }
        
        return (0, 0)
    }
}
