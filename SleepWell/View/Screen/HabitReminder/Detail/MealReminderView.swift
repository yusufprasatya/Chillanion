//
//  MealReminderView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import SwiftUI

struct MealReminderView: View {
    @State private var isReminderActive: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var dailyHabitViewModel = DailyHabitsViewModel()

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.darkBlue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 23) {
                ZStack {
                    Image("stoplatemealbg")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 342, height: 305)
                        .padding(.top, 24)
                }
                
                VStack(alignment: .leading) {
                    Toggle(isOn: $isReminderActive, label: {
                        Text("Remind me on these days ")
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                        Text("To stop my meals")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                    })
                
                    
                    Text("Reminder time")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 23)
                    Text("3 hours before bedtime😍")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                
                    Spacer()
                    RoundedButton(
                        title: "Done",
                        action: {
                            let every12Hour: TimeInterval = 12 * 60 * 60
                            if isReminderActive {
                                UserNotificationService.shared.scheduleNotification(identifier: "lateMeals", type: "time", timeInterval: every12Hour, title: "Late Meals", body: "Let your body rest at night Stop eating four hours before sleep to ensure sweet dreams and uninterrupted Zzz's! 😴🌙", notifHour: nil)
                            }else {
                                UserNotificationService.shared.disableNotifications(identifiers: ["limitCaffeine"])
                            }
                            dailyHabitViewModel.updateReminder(name: "Stop Late Meals", isRemind: isReminderActive)

                            self.presentationMode
                                .wrappedValue
                                .dismiss()
                        },
                        backgroundColor: .primaryButton,
                        foregroundColor: .white,
                        cornerRadius: 15)
                }
                .padding(.horizontal, 20)
            }
            .onAppear{
                dailyHabitViewModel.getDailyHabit(name: "Stop Late Meals")
                isReminderActive = dailyHabitViewModel.isRemind
            }
            .navigationTitle("Stop Late Meal")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Color.darkBlue,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    MealReminderView()
}
