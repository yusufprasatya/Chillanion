//
//  StepReminderView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import SwiftUI
import CoreData

struct StepReminderView: View {
    @State private var isRecommendedReminderActive: Bool = false
    @State private var isManualReminderActive: Bool = false
    @State private var remindTime: Date = Date()
    @State private var isManual: Bool = false
    @State private var isRemind: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject private var userViewModel = UserViewModel()
    @ObservedObject private var reminderViewModel = ReminderViewModel()
    @ObservedObject private var dailyHabitViewModel = DailyHabitsViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.darkBlue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack(spacing: 23) {
                    ZStack {
                        Image("stepbg")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 342, height: 342)
                            .padding(.top, 10)
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

                                    var nextAllowedHour = currentHour + 3

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
                                    
                                    UserNotificationService.shared.scheduleNotification(identifier: "step", type: "time", timeInterval: 66, title: "Step", body: "Boost your sleep quality by adding daily steps to your routine. A little physical activity can harmonize your body's internal clock and improve your restful nights. Keep moving for better sleep!", notifHour: nil)
                                } else if isRecommendedReminderActive == false {
                                    UserNotificationService.shared.disableNotifications(identifiers: ["step"])
                                    isRemind = false
                                }
                                
                                if isManualReminderActive {
                                    isRemind = true
                                    isManual =  true
                                    
                                    print("time remind \(remindTime)")
                                    let calendar = Calendar.current
                                    let components = calendar.dateComponents([.hour, .minute], from: remindTime)
                                    print("compo \(components)")
                                    UserNotificationService.shared.scheduleNotification(identifier: "step", type: "date", timeInterval: nil, title: "Step", body: "Boost your sleep quality by adding daily steps to your routine. A little physical activity can harmonize your body's internal clock and improve your restful nights. Keep moving for better sleep!", notifHour: components)
                                } else if isManualReminderActive {
                                    UserNotificationService.shared.disableNotifications(identifiers: ["step"])
                                    isManual = false
                                }
                                
                                dailyHabitViewModel.updateReminder(name: "Step", isRemind: isRemind, isManual: isManual)
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
                .onAppear {
                    dailyHabitViewModel.getDailyHabit(name: "Step")
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
                .navigationTitle("Step")
                .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbarBackground(
                    Color.darkBlue,
                    for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            }
        }
    }
}

extension StepReminderView {
    func getHabitFetchRequest(name: String) -> NSFetchRequest<DailyHabits> {
        let request: NSFetchRequest<DailyHabits> = DailyHabits.fetchRequest()
        
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: false)]
        
        let predicate = NSPredicate(format: "name == %@", name)
        request.predicate = predicate
        
        return request
    }
}

#Preview {
    StepReminderView()
}
