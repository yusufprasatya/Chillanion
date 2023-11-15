//
//  SleepWellApp.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 10/10/23.
//

import SwiftUI

@main
struct SleepWellApp: App {
    @StateObject var healthStore: SleepManager = SleepManager()
    @StateObject var weekStore: WeekStore = WeekStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(healthStore)
                .environmentObject(weekStore)
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
                .onAppear{
                    PersistenceController.shared.seedDataIfNeeded()
                }
        }
    }
}
