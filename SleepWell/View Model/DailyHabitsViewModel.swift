//
//  DailyHabitsViewModel.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 14/11/23.
//

import Foundation

class DailyHabitsViewModel: ObservableObject {
    @Published var isRemind: Bool = false
    @Published var isManual: Bool = false
    
    func getDailyHabit(name: String) -> DailyHabits{
        let dailyHabit = PersistenceController.shared.fetchDailyHabit(name: name)
        isRemind = dailyHabit.isRemind
        isManual = dailyHabit.isManual
        return dailyHabit
    }
    
    func updateReminder(name: String, isRemind: Bool, isManual: Bool) {
        var dailyHabbit = getDailyHabit(name: name)
        dailyHabbit.isRemind = isRemind
        dailyHabbit.isManual = isManual
        PersistenceController.shared.updateReminder(dailyHabit: dailyHabbit)
    }
}
