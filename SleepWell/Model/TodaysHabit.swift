//
//  TodaysHabit.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 21/11/23.
//

import Foundation

struct TodayHabit: Codable {
    let name: String
    let icon: String
    let desc: String
    let isDone: Bool
    let date: Date
    
    init(name: String, icon: String, desc: String, isDone: Bool, date: Date) {
        self.name = name
        self.icon = icon
        self.desc = desc
        self.isDone = isDone
        self.date = date
    }
}
