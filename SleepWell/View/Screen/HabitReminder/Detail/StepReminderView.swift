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
                    //                    Rectangle()
                    //                        .fill(LinearGradient(gradient: Gradient(colors: [.navyBlue, .paleAqua]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    //                        .frame(width: .infinity, height: 250)
                    //                        .cornerRadius(10)
                    //                        .padding(.top, 10)
                    Image("stepbg")
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
                        Text("To maintain my daily step")
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
                            dailyHabitViewModel.updateReminder(name: "Step")
                            
                            let notifEveryThreeHours: TimeInterval = 3 * 60 * 60
                            UserNotificationService.shared.scheduleNotification(type: "time", timeInterval: notifEveryThreeHours, title: "Step", body: "Boost your sleep quality by adding daily steps to your routine. A little physical activity can harmonize your body's internal clock and improve your restful nights. Keep moving for better sleep!", notifHour: nil)
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
