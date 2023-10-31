//
//  LimitAlcoholView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 31/10/23.
//

import SwiftUI

struct LimitAlcoholView: View {
    @State private var isReminderActive: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject private var userViewModel = UserViewModel()
    @ObservedObject private var reminderViewModel = ReminderViewModel()
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
                    Image("ReminderBgPurple")
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(15)
                        .padding(.top, 10)
//                    HStack {
//                        VStack (alignment: .leading) {
//                            Text("Step")
//                                .font(.system(size: 28, weight: .bold, design: .rounded))
//
//                            Text("lorem ipsum dolor siamet")
//                                .font(.system(size: 17, weight: .regular, design: .rounded))
//                        }
//                        Text("🏃")
//                            .font(.system(size: 150, weight: .semibold, design: .rounded))
//                    }
                    VStack (alignment: .leading) {
                        Text("Limit Alcohol")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        Text("️*. Alcohol Sip Timing: Wrap up that last sip of alcohol 3-4 hours before bedtime for a cozier night's sleep. \n*. Sweet Dreams Assurance: Allowing your body to process the spirits guarantees uninterrupted slumber. \n*. Restful Nights Ahead: By following this bedtime rule, you'll be on your way to a well-rested night! 😴🍷🚫🌙 ")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        
                    }
                    .frame(width: 330)
                    .padding()
                }
                VStack(alignment: .leading) {
                    Toggle(isOn: $reminderViewModel.isRemind, label: {
                        Text("Remind me ")
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                        Text("To stop alcohol")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                    })
                    
                    
                    Text("Reminder time")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 23)
                    Text("4 hours before bedtime")
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
            .navigationTitle("Alcohol")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Color.darkBlue,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    LimitAlcoholView()
}
