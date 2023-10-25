//
//  SleepEntry.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 19/10/23.
//

import Foundation

struct SleepEntry: Identifiable, Equatable{
    var id = UUID()
    let startDate: Date
    let endDate: Date
    let sleepStages: String
    let duration: TimeInterval
    let source: String
    
    init(id: UUID, startDate: Date, endDate: Date, sleepStages: String, duration: TimeInterval, source: String) {
        self.id = id
        self.startDate = startDate
        self.endDate = endDate
        self.sleepStages = sleepStages
        self.duration = duration
        self.source = source
    }
}
