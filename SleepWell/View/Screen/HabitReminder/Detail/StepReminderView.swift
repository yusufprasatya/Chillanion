//
//  StepReminderView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import SwiftUI

struct StepReminderView: View {
    @State private var isReminderActive: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject private var userViewModel = UserViewModel()
    @ObservedObject private var reminderViewModel = ReminderViewModel()
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blackRegular, .blackRegular]), startPoint: .top, endPoint: .bottom)
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
                        .padding(.top, 10)//                        .overlay(
//                            // Skip Button
//                            Text("🏃")
//                                .font(.system(size: 150, weight: .semibold))
//                            , alignment: .topTrailing
//                        )
////                    HStack {
////                        VStack (alignment: .leading) {
////                            Text("Step")
////                                .font(.system(size: 28, weight: .bold, design: .rounded))
////                            
////                            Text("lorem ipsum dolor siamet")
////                                .font(.system(size: 17, weight: .regular, design: .rounded))
////                        }
////                        Text("🏃")
////                            .font(.system(size: 150, weight: .semibold, design: .rounded))
////                    }
//                    VStack (alignment: .leading) {
//                        Text("Step")
//                            .font(.system(size: 28, weight: .bold, design: .rounded))
//                            .foregroundColor(.white)
//                        
//                        Text("️🚶🏼‍Daily Steps for Sweet Dreams:  . ")
//                            .font(.system(size: 18, weight: .bold, design: .rounded))
//                            .foregroundColor(.white)
//                        Text("️Daily steps improve sleep quality by regulating body temperature and reducing stress. ")
//                            .font(.system(size: 16, weight: .regular, design: .rounded))
//                            .foregroundColor(.white)
//                            .padding(.bottom, 20)
//                        
//                        Text("️👣 Quality Sleep Upgrade:  ")
//                            .font(.system(size: 18, weight: .bold, design: .rounded))
//                            .foregroundColor(.white)
//                        Text("️This lead to better sleep and preparing you to be refreshed in the morning. ")
//                            .font(.system(size: 16, weight: .regular, design: .rounded))
//                            .foregroundColor(.white)
//                            .padding(.bottom, 20)
//                        Text("️⏰ Clockwork Rhythms:  ")
//                            .font(.system(size: 18, weight: .bold, design: .rounded))
//                            .foregroundColor(.white)
//                        Text("️Your body's internal clock will be synchronized with gratitude and thank you!")
//                            .font(.system(size: 16, weight: .regular, design: .rounded))
//                            .foregroundColor(.white)
//                            .padding(.bottom, 20)
//                        
//                    }
                   
                   
                }
                VStack(alignment: .leading) {
                    Toggle(isOn: $reminderViewModel.isRemind, label: {
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
                            let reminder = ReminderModel(name: "Step", category: "Day activity", remindTime: Date(), isRemind: true)
                            
                            let notifEveryThreeHours: TimeInterval = 3 * 60 * 60
                            PersistenceController.shared.saveReminder(reminder: reminder)
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

#Preview {
    StepReminderView()
}
