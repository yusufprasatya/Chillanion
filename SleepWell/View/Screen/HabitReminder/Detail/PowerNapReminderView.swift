//
//  SwiftUIView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import SwiftUI

struct PowerNapReminderView: View {
    @State private var isReminderActive: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var dailyHabitViewModel = DailyHabitsViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.darkBlue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 23) {
                ZStack {
                    Image("powernapbg")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 342, height: 305)
                        .padding(.top, 10)
                    
                }
                
                VStack(alignment: .leading) {
                    Toggle(isOn: $isReminderActive , label: {
                        Text("Remind me ")
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                        Text("To take a power nap")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                    })
                    
                    Text("Reminder time")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 23)
                    Text("15 minutes after wake-up")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                    Spacer()
                    RoundedButton(
                        title: "Done",
                        action: {
                            print("reminder \(isReminderActive)")
                            let currentDate = Date()
                            var components = Calendar.current.dateComponents([.hour, .minute, .second], from: currentDate)
                            
                            // Set the notification time to the next 4-hour interval excluding time up to 11 PM
                            if components.hour! < 23 {
                                components.hour = (components.hour! / 4 + 1) * 4
                            } else {
                                // If it's after 11 PM, schedule the next notification at 4 AM the next day
                                components.hour = 4
                                components.minute = 0
                            }
                            
                            if isReminderActive {
                                UserNotificationService.shared.scheduleNotification(identifier: "powerNap", type: "date", timeInterval: nil, title: "Power Nap", body: "Seems like you were short of sleep last night! Take a 20-minute power nap to power up your energy!⚡️", notifHour: components)
                            } else {
                                UserNotificationService.shared.disableNotifications(identifiers: ["powerNap"])
                            }
                            dailyHabitViewModel.updateReminder(name: "Power Nap", isRemind: isReminderActive)
                            
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
                dailyHabitViewModel.getDailyHabit(name: "Power Nap")
                isReminderActive = dailyHabitViewModel.isRemind
            }
            .padding()
            .navigationTitle("Power Nap")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Color.darkBlue,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    PowerNapReminderView()
}
