//
//  UserViewModel.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 25/10/23.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var user: UserModel?
    @Published var name: String = ""
    @Published var bedTimeCommitment: Date = Date()
    @Published var wakeUpTime: Date = Date()
    
    func getUser() {
        let userData = PersistenceController.shared.fetch()
        self.name = userData.name ?? ""
        self.bedTimeCommitment = userData.bedTimeCommitment ?? Date()
        self.wakeUpTime = userData.targetWakeUpTime ?? Date()
    }
}
