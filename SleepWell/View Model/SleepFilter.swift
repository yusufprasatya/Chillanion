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
        for sleep in sleepData {
            do {
                if sleep.sleepStages == "In Bed" &&
                    !sleep.source.localizedCaseInsensitiveContains("watch"){
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
            //            print(sleep)
            //            print(sleep.duration)
            totalDuration += sleep.duration
        }
        return totalDuration
    }
    
    func filteringSleepStages(sleepData: [SleepEntry],selectedDay: Date, sleepStage: String, startOfOpeningHours: Date, endOfOpeningHours: Date) -> [SleepEntry] {
        let filteredEntries = sleepData.filter { entry in
            entry.startDate >= startOfOpeningHours && entry.endDate <= endOfOpeningHours
        }
        
        print("dari \(startOfOpeningHours) sampe \(endOfOpeningHours)")
        for sleep in filteredEntries {
            print("Sleep \(sleep.startDate) wake up \(sleep.endDate)")
        }
        return filteredEntries
        
    }
    
    func filteringSleepDaily(sleepData: [SleepEntry], selectedDay: Date, startOfOpeningHours: Date, endOfOpeningHours: Date) -> [SleepEntry] {
        let filteredEntries = sleepData.filter { entry in
              // Check if the entry is for the selected day
            entry.startDate >= startOfOpeningHours && entry.endDate <= endOfOpeningHours && !entry.source.localizedCaseInsensitiveContains("watch")
          }

          return filteredEntries
    }
    
    func filteringSleepDailyBySource(sleepData: [SleepEntry]) -> [SleepEntry] {
        let sleepByWatch = sleepData.filter { entry in entry.source.localizedCaseInsensitiveContains("watch") }
        let sleepByPhone = sleepData.filter { entry in !entry.source.localizedCaseInsensitiveContains("watch") }

        print("sleepByWatch \(sleepByWatch.count) sleepByPhone \(sleepByPhone.count)")
        return !sleepByWatch.isEmpty ? sleepByWatch : sleepByPhone
    }
}
