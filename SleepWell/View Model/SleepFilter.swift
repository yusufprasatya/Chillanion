//
//  SleepFiter.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 27/10/23.
//

import Foundation

struct SleepFilter {
    func calculateThreeMonthTotalDurationOfSleep(sleepData: [SleepEntry]) -> (hours: Int, minutes: Int) {
        var totalDuration: TimeInterval = 0
        print("Msdokkk ini lsh")
        for sleep in sleepData {
            do {
                print("masuuk do")
                if sleep.sleepStages == "In Bed" &&
                    !sleep.source.localizedCaseInsensitiveContains("watch"){
                    print("data harusnyanmasoook")
                    totalDuration += sleep.duration
                }
            } catch {
                print("Error: \(error)")
            }
        }
        
        let average = totalDuration / 90
        
        return DateUtil.extractNumbers(from: DateUtil.humanReadableHour(data: average))
        
    }
    
    func getTotalDurationSleep(sleepData: [SleepEntry]) -> TimeInterval{
        var totalDuration: TimeInterval = 0
        for sleep in sleepData {
            print(sleep)
            print(sleep.duration)
            totalDuration += sleep.duration
        }
        return totalDuration
    }
    
    func filteringSleepStages(sleepData: [SleepEntry],selectedDay: Date, sleepStage: String, startOfOpeningHours: Date, endOfOpeningHours: Date) -> [SleepEntry] {
        let filteredEntries = sleepData.filter { entry in
            entry.startDate >= startOfOpeningHours && entry.endDate <= endOfOpeningHours
        }
        
        return filteredEntries
        
    }
}
