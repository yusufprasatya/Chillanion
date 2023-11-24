//
//  MeditationView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 31/10/23.
//

import SwiftUI

struct MeditationView: View {
    @State private var isReminderActive: Bool = false
    @State private var isRecommendedReminderActive: Bool = false
    @State private var isManualReminderActive: Bool = false
    @State private var remindTime: Date = Date()
    @State private var isRemind: Bool = false
    @State private var isManual: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject private var userViewModel = UserViewModel()
    @ObservedObject private var dailyHabitViewModel = DailyHabitsViewModel()
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.darkBlue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: 23) {
                    ZStack {
                        Image("meditationbg")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 342, height: 305)
                            .padding(.top, 10)
                    }
                    VStack(alignment: .leading) {
                        Toggle(isOn: $isRecommendedReminderActive, label: {
                            Text("Reminder time")
                                .font(.system(size: 16, weight: .regular, design: .rounded))
                                .foregroundColor(.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .padding(.top, 23)
                                .padding(.bottom, 3)
                            Text("40 minutes before bedtime \n(recommendation)")
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
                                if isRecommendedReminderActive{
                                    isManual = false
                                    isRemind = true
                                    let bedTime = userViewModel.bedTimeCommitment
                                    let calendar = Calendar.current
                                    let hourBeforeSleep = calendar.date(byAdding: .minute, value: 40, to: bedTime)
                                    
                                    let triggerDateComponents = calendar.dateComponents([.hour, .minute, .second], from: hourBeforeSleep!)
                                    
                                    UserNotificationService.shared.scheduleNotification(identifier: "meditation", type: "date", timeInterval: nil, title: "Meditation", body: "Relax and sleep better with mindfulness—soothe your mind. 🌙💆‍♂️", notifHour: triggerDateComponents)
                                } else if isRecommendedReminderActive == false {
                                    UserNotificationService.shared.disableNotifications(identifiers: ["meditation"])
                                    isRemind = false
                                }
                                
                                if isManualReminderActive {
                                    isRemind = true
                                    isManual =  true
                                    
                                    print("time remind \(remindTime)")
                                    let calendar = Calendar.current
                                    let components = calendar.dateComponents([.hour, .minute], from: remindTime)
                                    print("compo \(components)")
                                    UserNotificationService.shared.scheduleNotification(identifier: "meditation", type: "date", timeInterval: nil, title: "Meditation", body: "Relax and sleep better with mindfulness—soothe your mind. 🌙💆‍♂️", notifHour: components)
                                } else if isManualReminderActive {
                                    UserNotificationService.shared.disableNotifications(identifiers: ["meditation"])
                                    isManual = false
                                }
                                
                                dailyHabitViewModel.updateReminder(name: "Meditation", isRemind: isRemind, isManual: isManual)
                                self
                                    .presentationMode
                                    .wrappedValue
                                .dismiss()},
                            backgroundColor: .primaryButton,
                            foregroundColor: .white,
                            cornerRadius: 15)
                        .offset(y: isManualReminderActive ? 0 : 100)
                    }
                    .padding(.horizontal, 20)
                }
                .onAppear{
                    dailyHabitViewModel.getDailyHabit(name: "Meditation")
                    isReminderActive = dailyHabitViewModel.isRemind
                    isRemind = dailyHabitViewModel.isRemind
                    isManual = dailyHabitViewModel.isManual
                    print("isRemind \(isRemind)")
                    print("isManual \(isManual)")
                    
                    if isManual == true {
                        withAnimation{
                            isManualReminderActive = true
                        }
                    }
                    if isRemind == true {
                        isRecommendedReminderActive = true
                    }
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
}

#Preview {
    MeditationView()
}
