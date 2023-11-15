//
//  CaffeineReminderView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import SwiftUI

struct CaffeineReminderView: View {
    @State private var isReminderActive: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var dailyHabitViewModel = DailyHabitsViewModel()

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.darkBlue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 23) {
                ZStack {
                    Image("limitcaffeinebg")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 342, height: 305)
                        .padding(.top, 10)
                }
                
                VStack(alignment: .leading) {
                    Toggle(isOn: $dailyHabitViewModel.isRemind, label: {
                        Text("Remind me ")
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                        Text("To limit caffeine")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                    })
                    
                    Text("Reminder time")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 23)
                    Text("6 hours before bedtime")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                    Spacer()
                    RoundedButton(
                        title: "Done",
                        action: {
                            // Get the current date and time
                                    let currentDate = Date()

                                    // Create a date component for 9 PM
                                    var dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: currentDate)
                                    dateComponents.hour = 21
                                    dateComponents.minute = 0
                            if let notificationDate = Calendar.current.date(byAdding: .hour, value: -6, to: dateComponents.date ?? Date()) {
                                let trigger6hour = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: notificationDate)
                                if isReminderActive {
                                    UserNotificationService.shared.scheduleNotification(identifier: "limitCaffeine", type: "date", timeInterval: nil, title: "Limit Caffeine", body: "It’s 6 hours before sleep! Time to limit your caffeine to have better sleep tonight!😌", notifHour: trigger6hour)
                                } else{
                                    UserNotificationService.shared.disableNotifications(identifiers: ["limitCaffeine"])

                                }
                            }
                            dailyHabitViewModel.updateReminder(name: "Limit Caffeine", isRemind: isReminderActive)
                            self.presentationMode
                                .wrappedValue
                                .dismiss()},
                        backgroundColor: .primaryButton,
                        foregroundColor: .white,
                        cornerRadius: 15)
                }
                .padding(.horizontal, 20)
            }
            .onAppear{
                dailyHabitViewModel.getDailyHabit(name: "Limit Caffeine")
                isReminderActive = dailyHabitViewModel.isRemind
            }
            .padding()
            .navigationTitle("Stop Caffeine")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Color.darkBlue,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    CaffeineReminderView()
}
