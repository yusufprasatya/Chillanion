//
//  ReminderingViewModel.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 28/10/23.
//

import Foundation

class ReminderViewModel: ObservableObject {
    @Published var isRemind: Bool = false
    
    func getReminder(name: String) {
        let reminder = PersistenceController.shared.fetchReminder(name: name)
        isRemind = reminder.isRemind
    }
}
