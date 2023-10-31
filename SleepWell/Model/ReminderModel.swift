//
//  ReminderModel.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 28/10/23.
//

import Foundation

struct ReminderModel: Codable {
    let name: String
    let categroy: String
    let remindTime: Date
    let isRemind: Bool
    
    init(name: String, category: String, remindTime: Date, isRemind: Bool) {
        self.name = name
        self.categroy = category
        self.remindTime = remindTime
        self.isRemind = isRemind
    }
    
    func getReminder() {
        
    }
}
