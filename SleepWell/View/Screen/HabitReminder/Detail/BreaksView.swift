//
//  SwiftUIView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import SwiftUI

struct BreaksView: View {
    @State private var isReminderActive: Bool = false
    @State private var isRecommendedReminderActive: Bool = false
    @State private var isManualReminderActive: Bool =  false
    @State private var remindTime: Date = Date()
    @State private var isManual: Bool = false
    @State private var isRemind: Bool = false
    
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
                    Toggle(isOn:  $isRecommendedReminderActive, label: {
                        Text("Reminder time")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(.top, 23)
                            .padding(.bottom, 3)
                        Text("Once every 3 hours \n(recommendation)")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                    })
                    .onChange(of: isRecommendedReminderActive) { val in
                        if isRecommendedReminderActive{
                            isManualReminderActive = false
                        }
                    }
                    
                    Toggle(isOn: $isManualReminderActive, label: {
                        Text("Choose my own time")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                    })
                    .onChange(of: isManualReminderActive){ value in
                        if isManualReminderActive{
                            isRecommendedReminderActive = false
                        }
                    }
                    if (isManualReminderActive) {
                        HStack{
                            Spacer()
                            VStack {
                                DatePicker("Select a Time", selection: $remindTime, displayedComponents: .hourAndMinute)
                                    .labelsHidden()
                                    .datePickerStyle(WheelDatePickerStyle())
                                    .frame(width: 180, height: 180)
                                    .background(.clear)
                                    .colorScheme(.dark)
                                    .cornerRadius(13)
                            }
                            Spacer()
                        }
                    }
                    Spacer()
                    RoundedButton(
                        title: "Done",
                        action: {
                            if isRecommendedReminderActive {
                                isManual = false
                                isRemind = true
                                let currentDate = Date()
                                let calendar = Calendar.current
                                let currentHour = calendar.component(.hour, from: currentDate)

                                var nextAllowedHour = currentHour + 4

                                // Check if the next allowed hour is within the restricted time range (22:00 - 6:00)
                                if nextAllowedHour >= 22 {
                                    nextAllowedHour = 6
                                }

                                // Set the next allowed notification date
                                var components = calendar.dateComponents([.hour, .minute], from: currentDate)
                                components.hour = nextAllowedHour
                                components.minute = 0

                                let nextAllowedDate = calendar.date(from: components)!

                                // Create a date trigger for the next allowed notification date
                                let triggerDateComponents = calendar.dateComponents([.hour, .minute, .second], from: nextAllowedDate)
                                
                                UserNotificationService.shared.scheduleNotification(identifier: "breaks", type: "time", timeInterval: 66, title: "Short Breaks", body: "Quick 5-10 min breaks: stretch or walk for instant energy and alertness! 🚶‍♂️💪", notifHour: nil)
                            } else if isRecommendedReminderActive == false {
                                UserNotificationService.shared.disableNotifications(identifiers: ["breaks"])
                                isRemind = false
                            }
                            
                            if isManualReminderActive {
                                isRemind = true
                                isManual =  true
                                
                                print("time remind \(remindTime)")
                                let calendar = Calendar.current
                                let components = calendar.dateComponents([.hour, .minute], from: remindTime)
                                print("compo \(components)")
                                UserNotificationService.shared.scheduleNotification(identifier: "breaks", type: "date", timeInterval: nil, title: "Short Breaks", body: "Quick 5-10 min breaks: stretch or walk for instant energy and alertness! 🚶‍♂️💪", notifHour: components)
                            } else if isManualReminderActive {
                                UserNotificationService.shared.disableNotifications(identifiers: ["breaks"])
                                isManual = false
                            }
                            
                            dailyHabitViewModel.updateReminder(name: "Short Breaks", isRemind: isRemind, isManual: isManual)

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
                isRemind = dailyHabitViewModel.isRemind
                isManual = dailyHabitViewModel.isManual
                print("isRemind \(isRemind)")
                print("isManual \(isManual)")
                
                if isManual == true {
                    isManualReminderActive = true
                }
                if isRemind == true {
                    isRecommendedReminderActive = true
                }
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
