//
//  WorkOutReminderView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import SwiftUI

struct WorkOutReminderView: View {
    @State private var isReminderActive: Bool = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.darkBlue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 23) {
                ZStack {
//                    Rectangle()
//                        .fill(LinearGradient(gradient: Gradient(colors: [.goldenYellow, .sageGreen]), startPoint: .topLeading, endPoint: .bottomTrailing))
//                        .frame(width: .infinity, height: 250)
//                        .cornerRadius(10)
//                        .padding(.top, 10)
                    Image("ReminderBgPurple")
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(15)
                        .padding(.top, 10)
                        
                    VStack (alignment: .leading) {
                        Text("Stop Heavy Workout")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    
                        Text("️ *. Exercise Timing: Avoid intense workouts before bedtime. \n*. Pre-Bed Transition: Intense exercise can elevate heart rate and body temperature, making sleep challenging. \n*. Daytime Workouts: Schedule exercise earlier for a happier, well-rested you! 😴🏋️‍♂️🚫🌙")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                    }
                    .frame(width: 330)
                    .padding()
//                    HStack {
//                        VStack (alignment: .leading) {
//                            Text("Stop Heavy Workout")
//                                .font(.system(size: 28, weight: .bold, design: .rounded))
//                            
//                            Text("lorem ipsum dolor siamet")
//                                .font(.system(size: 17, weight: .regular, design: .rounded))
//                        }
//                        Text("🏋🏻")
//                            .font(.system(size: 150, weight: .semibold, design: .rounded))
//                    }
                }
                
                VStack(alignment: .leading) {
                    Toggle(isOn: $isReminderActive, label: {
                        Text("Remind me on these days ")
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                        
                        Text("To stop heavy workout")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                    })
                    
                    Text("Reminder time")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 23)
                    Text("3 hours before bedtime")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                
                    Spacer()
                    RoundedButton(
                        title: "Done",
                        action: {
                            UserNotificationService.shared.scheduleNotification(type: "date", timeInterval: nil, title: "Work-out", body: "Skip tough workouts before bed/ Your body needs to unwind and prepare for sweet dream🥱", notifHour: nil)
                            self.presentationMode
                                .wrappedValue
                                .dismiss()
                        },
                        backgroundColor: .primaryButton,
                        foregroundColor: .white,
                        cornerRadius: 15)
                }
                .padding(.horizontal, 20)
            }
            .navigationTitle("Stop Heavy Workout")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Color.darkBlue,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    WorkOutReminderView()
}
