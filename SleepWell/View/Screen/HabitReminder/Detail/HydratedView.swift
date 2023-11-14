//
//  SwiftUIView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import SwiftUI

struct HydratedView: View {
    @State private var isReminderActive: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var dailyHabitViewModel = DailyHabitsViewModel()

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.darkBlue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 23) {
                ZStack {
                    Image("hydratedbg")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 342, height: 305)
                        .padding(.top, 24)
                }
                
                VStack(alignment: .leading) {
                    Toggle(isOn: $dailyHabitViewModel.isRemind, label: {
                        Text("Remind me ")
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                        Text("To stay hydrated")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                    })
                    
                    
                    Text("Reminder time")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 23)
                    Text("Once every 3 hours")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                    Spacer()
                    RoundedButton(
                        title: "Done",
                        action: {
                            dailyHabitViewModel.updateReminder(name: "Stay Hydrated")
                            
                            let notifEveryThreeHours: TimeInterval = 3 * 60 * 60
                            UserNotificationService.shared.scheduleNotification(type: "time", timeInterval: notifEveryThreeHours, title: "Stay Hydrated", body: "Stay peppy! Sip on water throughout the day to keep fatigue at bay!😉", notifHour: nil)
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
                dailyHabitViewModel.getDailyHabit(name: "Stay Hydrated")
            }
            .navigationTitle("Hydrate")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Color.darkBlue,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    HydratedView()
}
