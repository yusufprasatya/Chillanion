//
//  JournalingReminderView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import SwiftUI

struct JournalingReminderView: View {
    @State private var isReminderActive: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var dailyHabitViewModel = DailyHabitsViewModel()
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.darkBlue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 23) {
                ZStack {
                    Image("journalingbg")
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
                        
                        Text("To do journaling")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                    })
                    
                    Text("Reminder time")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 23)
                    Text("20 minutes before sleep")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                
                    Spacer()
                    RoundedButton(
                        title: "Done",
                        action: {
//                            UserNotificationService.shared.scheduleNotification(identifier: "Journal", type: "date", timeInterval: nil, title: "Work-out", body: "Skip tough workouts before bed/ Your body needs to unwind and prepare for sweet dream🥱", notifHour: nil)
                            dailyHabitViewModel.updateReminder(name: "Journaling", isRemind: isReminderActive)
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
                dailyHabitViewModel.getDailyHabit(name: "Journaling")
                isReminderActive = dailyHabitViewModel.isRemind
            }
            .navigationTitle("Journaling")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Color.darkBlue,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    JournalingReminderView()
}
