//
//  StepReminderView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import SwiftUI
import CoreData

struct StepReminderView: View {
    @State private var isReminderActive: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject private var userViewModel = UserViewModel()
    @ObservedObject private var reminderViewModel = ReminderViewModel()
    @ObservedObject private var dailyHabitViewModel = DailyHabitsViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.darkBlue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 23) {
                ZStack {
                    Image("stepbg")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 342, height: 342)
                        .padding(.top, 10)
                }
                VStack(alignment: .leading) {
                    Toggle(isOn: $isReminderActive, label: {
                        Text("Remind me ")
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                        Text("To maintain my daily step")
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
                                UserNotificationService.shared.scheduleNotification(identifier: "step", type: "date", timeInterval: nil, title: "Step", body: "Boost your sleep quality by adding daily steps to your routine. A little physical activity can harmonize your body's internal clock and improve your restful nights. Keep moving for better sleep!", notifHour: triggerDateComponents)
                            } else{
                                UserNotificationService.shared.disableNotifications(identifiers: ["powerNap"])
                            }
                            dailyHabitViewModel.updateReminder(name: "Step", isRemind: isReminderActive)
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
            .onAppear {
                dailyHabitViewModel.getDailyHabit(name: "Step")
                isReminderActive = dailyHabitViewModel.isRemind
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
