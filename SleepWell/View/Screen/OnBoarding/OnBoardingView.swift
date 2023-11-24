//
//  OnBoardingView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 16/10/23.
//

import SwiftUI

struct OnBoardingView: View {
    @State private var name: String = ""
    @State private var screen: Int = 0
    @State private var next: Bool = false
    @State private var isAlertPresented = false
    @State private var avgSleep: TimeInterval = 0

    @State private var wakeTime: Date = Date()
    @State private var showingAlert = false
    @State private var sleepDuration: TimeInterval = 0
    @State private var averageSleepDuration = ""
    @ObservedObject private var sleepManager = SleepManager()
    
    var body: some View {
        ZStack {
            if screen == 12 {
                Text("screen 12")
            }
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            switch screen {
            case 0:
                SleepProblemView(screen: $screen)
            case 1:
                SecondSleepProblemView(screen: $screen)
            case 2:
                FeatureView(screen: $screen)
            case 3:
                Screen1View(screen: $screen)
            case 4:
                Screen2View(screen: $screen, name: $name)
            case 5:
                AppleWatchRecommendation(screen: $screen)
            case 6:
                Screen3View(screen: $screen, name: $name)
            case 7:
                Screen4View(screen: $screen, averageSleepDuration: $averageSleepDuration, avgSleep: $avgSleep)
            case 8:
                Screen5View(screen: $screen, averageSleepDuration: $averageSleepDuration, avgSleep: $avgSleep)
            case 9:
                Screen6View(screen: $screen)
            case 10:
                Screen8View(screen: $screen, name: $name, averageSleepDuration: $averageSleepDuration)
            case 11:
                HomeScreenView()
            default:
                EmptyView() // Handle cases where screen doesn't match any of the above
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}

#Preview{
    OnBoardingView()
}
