//
//  DetailHabitReminderView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import SwiftUI
import Foundation

struct SunlightReminderView: View {
    @State private var isRecommendedReminderActive: Bool =  false
    @State private var isManualReminderActive: Bool =  false
    @State private var reminderTime: Date = Date()
    @State private var isManual: Bool = false
    @State private var isRemind: Bool = false
    @State private var remindTime = Date()
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject private var userViewModel = UserViewModel()
    @ObservedObject private var reminderViewModel = ReminderViewModel()
    @ObservedObject private var dailyHabitViewModel = DailyHabitsViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blackRegular, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack (spacing: 25){
                    ZStack {
                        Image("sunlightbg")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 342, height: 305)
                            .padding(.top, 10)
                    }
                    VStack(alignment: .leading) {
                        Toggle(isOn:  $isRecommendedReminderActive, label: {
                            Text("Reminder time")
                                .font(.system(size: 16, weight: .regular, design: .rounded))
                                .foregroundColor(.white)
                                .foregroundColor(.white)
                                .padding(.top, 23)
                            Text("15 minutes after wake-up (recommendation)")
                                .font(.system(size: 16, weight: .regular, design: .rounded))
                                .foregroundColor(.white)
                        })
                        .onChange(of: isRecommendedReminderActive) { val in
                            if isRecommendedReminderActive{
                                isManualReminderActive = false
                            }
                        }
                        
                        Toggle(isOn:  $isManualReminderActive, label: {
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
                                    DatePicker("Select a Time", selection: $reminderTime, displayedComponents: .hourAndMinute)
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
                                
                                if isRecommendedReminderActive{
                                    isManual = false
                                    isRemind = true
                                    let wakeUpTime = userViewModel.wakeUpTime
                                    let calendar = Calendar.current
                                    let date15MinutesFromWakeUp = calendar.date(byAdding: .minute, value: 15, to: wakeUpTime)
                                    
                                    let triggerDateComponents = calendar.dateComponents([.hour, .minute, .second], from: date15MinutesFromWakeUp!)
                                    
                                    UserNotificationService.shared.scheduleNotification(identifier: "sunlight", type: "date", timeInterval: nil, title: "Sunlight", body: "Rise and shine! Grab 15-min sun for a brighter mood!☀️🌈", notifHour: triggerDateComponents)
                                } else if isRecommendedReminderActive == false {
                                    UserNotificationService.shared.disableNotifications(identifiers: ["sunlight"])
                                    isRemind = false
                                }
                                
                                if isManualReminderActive {
                                    isRemind = true
                                    isManual =  true
                                    
                                    print("time remind \(remindTime)")
                                    let calendar = Calendar.current
                                    let components = calendar.dateComponents([.hour, .minute], from: remindTime)
                                    print("compo \(components)")
                                    UserNotificationService.shared.scheduleNotification(identifier: "sunlight", type: "date", timeInterval: nil, title: "Step", body: "Rise and shine! Grab 15-min sun for a brighter mood!☀️🌈", notifHour: components)
                                } else if isManualReminderActive {
                                    UserNotificationService.shared.disableNotifications(identifiers: ["sunlight"])
                                    isManual = false
                                }
                                
                                dailyHabitViewModel.updateReminder(name: "Sunlight", isRemind: isRemind, isManual: isManual)

                                self.presentationMode.wrappedValue.dismiss()
                            },
                            backgroundColor: .primaryButton,
                            foregroundColor: .white,
                            cornerRadius: 15)
                        .offset(y: isManualReminderActive ? 0 : 100)
                    }
                    .padding(.horizontal, 20)
                }
                .onAppear {
                    userViewModel.getUser()
                    dailyHabitViewModel.getDailyHabit(name: "Sunlight")
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
}

#Preview {
    SunlightReminderView()
}
