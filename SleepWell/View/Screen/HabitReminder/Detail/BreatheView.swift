//
//  SwiftUIView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import SwiftUI

struct BreatheView: View {
    @State private var isReminderActive: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var dailyHabitViewModel = DailyHabitsViewModel()

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.darkBlue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 23) {
                ZStack {
                    Image("breathbg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 342, height: 342)
                    .padding(.top, 10)

                }
                
                VStack(alignment: .leading) {
                    Toggle(isOn: $dailyHabitViewModel.isRemind, label: {
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
                            
                            dailyHabitViewModel.updateReminder(name: "Mindful Breathing")
                            
                            let notifEveryThreeHours: TimeInterval = 3600
                            UserNotificationService.shared.scheduleNotification(type: "time", timeInterval: notifEveryThreeHours, title: "Breathe", body: "Seems like you were short of sleep last night! Take a 20-minute power nap to power up your energy!⚡️", notifHour: nil)
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
                dailyHabitViewModel.getDailyHabit(name: "Mindful Breathing")
            }
            .padding()
            .navigationTitle("Breathe")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Color.darkBlue,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    BreatheView()
}
