//
//  DetailHabitReminderView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import SwiftUI
import Foundation

struct SunlightReminderView: View {
    @State private var isReminderActive: Bool =  false
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject private var userViewModel = UserViewModel()
    @ObservedObject private var reminderViewModel = ReminderViewModel()
    @ObservedObject private var dailyHabitViewModel = DailyHabitsViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blackRegular, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack (spacing: 25){
                ZStack {
                    Image("sunlightbg")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 342, height: 305)
                        .padding(.top, 10)
                }
                
                VStack(alignment: .leading) {
                    Toggle(isOn:  $isReminderActive, label: {
                        Text("Remind me ")
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                        Text("To get sunlight exposure")
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
                            let wakeUpTime = userViewModel.wakeUpTime
                            let calendar = Calendar.current
                            let date15MinutesFromWakeUp = calendar.date(byAdding: .minute, value: 15, to: wakeUpTime)
                            
                            let triggerDateComponents = calendar.dateComponents([.hour, .minute, .second], from: date15MinutesFromWakeUp!)
                            
                            if isReminderActive {
                                UserNotificationService.shared.scheduleNotification(identifier: "sunLight", type: "date", timeInterval: nil, title: "Sunlight", body: "Rise and shine, gorgeous! Get 15-minutes sunlight to start your day brighter and have a better mood!🌤️", notifHour: triggerDateComponents)
                            }else {
                                UserNotificationService.shared.disableNotifications(identifiers: ["sunLight"])
                            }
                            
                            dailyHabitViewModel.updateReminder(name: "Sunlight", isRemind: isReminderActive)
                            self.presentationMode.wrappedValue.dismiss()
                        },
                        backgroundColor: .primaryButton,
                        foregroundColor: .white,
                        cornerRadius: 15)
                }
                .padding(.horizontal, 20)
            }
            .onAppear {
                dailyHabitViewModel.getDailyHabit(name: "Sunlight")
                isReminderActive = dailyHabitViewModel.isRemind
            }
            .padding()
            .navigationTitle("Sunlight")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Color.darkBlue,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    SunlightReminderView()
}
