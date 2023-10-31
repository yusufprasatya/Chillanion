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
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(healthStore)
        }
    }
}
