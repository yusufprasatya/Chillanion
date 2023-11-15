//
//  MeditationView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 31/10/23.
//

import SwiftUI

struct MeditationView: View {
    @State private var isReminderActive: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject private var userViewModel = UserViewModel()
    @ObservedObject private var dailyHabitViewModel = DailyHabitsViewModel()
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.darkBlue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 23) {
                ZStack {
                    Image("meditationbg")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 342, height: 305)
                        .padding(.top, 10)
                }
                VStack(alignment: .leading) {
                    Toggle(isOn: $isReminderActive, label: {
                        Text("Remind me ")
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                        Text("To do meditation")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                    })
                    
                    Text("Reminder time")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 23)
                    Text("30 minutes before sleep")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                    Spacer()
                    RoundedButton(
                        title: "Done",
                        action: {
//                            let reminder = ReminderModel(name: "Step", category: "Day activity", remindTime: Date(), isRemind: true)
//                            
//                            let notifEveryThreeHours: TimeInterval = 3 * 60 * 60
//                            PersistenceController.shared.saveReminder(reminder: reminder)
//                            UserNotificationService.shared.scheduleNotification(identifier: "step", type: "time", timeInterval: notifEveryThreeHours, title: "Step", body: "Boost your sleep quality by adding daily steps to your routine. A little physical activity can harmonize your body's internal clock and improve your restful nights. Keep moving for better sleep!", notifHour: nil)
                            dailyHabitViewModel.updateReminder(name: "Meditation", isRemind: isReminderActive)
                            self
                                .presentationMode
                                .wrappedValue
                                .dismiss()},
                        backgroundColor: .primaryButton,
                        foregroundColor: .white,
                        cornerRadius: 15)
                }
                .padding(.horizontal, 20)
            }
            .onAppear{
                dailyHabitViewModel.getDailyHabit(name: "Meditation")
                isReminderActive = dailyHabitViewModel.isRemind
            }
            .padding()
            .navigationTitle("Meditation")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Color.darkBlue,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    MeditationView()
}
