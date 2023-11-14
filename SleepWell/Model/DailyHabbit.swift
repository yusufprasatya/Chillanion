//
//  DailyHabbit.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 14/11/23.
//

import Foundation

struct DailyHabbit: Codable {
    let name: String
    let icon: String
    let desc: String
    let isRemind: Bool
    let date: Date
    
    init(name: String, icon: String, desc: String, isRemind: Bool, date: Date) {
        self.name = name
        self.icon = icon
        self.desc = desc
        self.isRemind = isRemind
        self.date = date
    }
}
