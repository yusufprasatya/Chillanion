//
//  SwiftUIView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import SwiftUI

struct BreaksView: View {
    @State private var isReminderActive: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var dailyHabitViewModel = DailyHabitsViewModel()
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.darkBlue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 23) {
                ZStack {
                    Image("breaksbg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 342, height: 342)
                    .padding(.top, 24)
                }
                
                VStack(alignment: .leading) {
                    Toggle(isOn: $isReminderActive, label: {
                        Text("Remind me ")
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                        Text("To take a breath")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                    })
                    
                    Text("Reminder time")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 23)
                    Text("Once an hour")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                    Spacer()
                    RoundedButton(
                        title: "Done",
                        action: {
                            let notifEveryTwoHours: TimeInterval =  2 * 60 * 60
                            if isReminderActive {
                                UserNotificationService.shared.scheduleNotification(identifier: "shortBreaks", type: "time", timeInterval: notifEveryTwoHours, title: "Short Breaks", body: "Grab quick 5-10 minute sweet breaks to stretch or walk for an instant energy boost and improved alertness!", notifHour: nil)
                            }else{
                                UserNotificationService.shared.disableNotifications(identifiers: ["shortBreaks"])
                            }
                            
                            dailyHabitViewModel.updateReminder(name: "Short Breaks", isRemind: isReminderActive)
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
                dailyHabitViewModel.getDailyHabit(name: "Short Breaks")
                isReminderActive = dailyHabitViewModel.isRemind
            }
            .navigationTitle("Breaks")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Color.darkBlue,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    BreaksView()
}
