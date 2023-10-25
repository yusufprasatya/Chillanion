//
//  UserModel.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import Foundation

struct UserModel: Codable {
    let name: String
    let sleepCycle: String
    let bedTimeCommitment: Date
    let targetWakeUpTime: Date
    
    init(name: String, sleepCycle: String, bedTimeCommitment: Date, targetWakeUpTime: Date) {
        self.name = name
        self.sleepCycle = sleepCycle
        self.bedTimeCommitment = bedTimeCommitment
        self.targetWakeUpTime = targetWakeUpTime
    }
}
