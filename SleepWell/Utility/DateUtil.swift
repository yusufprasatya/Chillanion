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
    
    static func getDayOfWeek() -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        let dayOfWeek = formatter.string(from: date)
        return dayOfWeek
    }
    // create function for get date now
    static func getDateNow() -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        let dateNow = formatter.string(from: date)
        return dateNow
    }
    
    static func calculateNextDateWithSameTime(from currentDate: Date, at desiredTime: Date) -> Date {
        let calendar = Calendar.current
        
        // Add one day to the current date
        let nextDate = calendar.date(byAdding: .day, value: 1, to: currentDate) ?? Date()
        
        // Combine the new date with the desired time
        let resultDate = calendar.date(bySettingHour: calendar.component(.hour, from: desiredTime),
                                       minute: calendar.component(.minute, from: desiredTime),
                                       second: calendar.component(.second, from: desiredTime),
                                       of: nextDate) ?? Date()
        
        return resultDate
    }
    
    static func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMM ''yy" // Set the desired format
        return dateFormatter.string(from: date)
    }
    
    static func formatDatedmmmyyyy(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy" // Set the desired format
        return dateFormatter.string(from: date)
    }
    
    static func calculateHours(endDate: Date) {
        let totalHours = Calendar.current.date(byAdding: .hour, value: 6, to: endDate) ?? Date() // Replace with your end date
        
        // Calculate the time difference in hours
        if let hoursBetween = Calendar.current.dateComponents([.hour], from: Date(), to: totalHours).hour {
            print("Total hours between the two times: \(hoursBetween) hours")
        } else {
            print("Error calculating hours")
        }
    }
    
}
