//
//  JournalingReminderView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import SwiftUI

struct JournalingReminderView: View {
    @State private var isReminderActive: Bool = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blackRegular, .blackRegular]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 23) {
                ZStack {
//                    Rectangle()
//                        .fill(LinearGradient(gradient: Gradient(colors: [.goldenYellow, .sageGreen]), startPoint: .topLeading, endPoint: .bottomTrailing))
//                        .frame(width: .infinity, height: 250)
//                        .cornerRadius(10)
//                        .padding(.top, 10)
                    Image("journalingbg")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 342, height: 305)
                        .padding(.top, 24)
//                        
//                    VStack (alignment: .leading) {
//                        Text("Journaling")
//                            .font(.system(size: 28, weight: .bold, design: .rounded))
//                            .foregroundColor(.white)
//                    
//                        Text("️ *. Pre-Sleep Journaling: Jot down your thoughts, dreams, or what's on your mind before snuggling up. \n*. Cozy Brain Blanket: It's like giving your brain a cozy blanket for more peaceful dreams. \n*. Nightly Ritual: Grab your journal and pen, and start your journey to a restful night! 😴📖🌙")
//                            .font(.system(size: 16, weight: .regular, design: .rounded))
//                            .foregroundColor(.white)
//                            .padding(.bottom, 20)
//                    }
//                    .frame(width: 330)
//                    .padding()
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
                        
                        Text("To do journaling")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                    })
                    
                    Text("Reminder time")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 23)
                    Text("20 minutes before sleep")
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
            .navigationTitle("Journaling")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Color.darkBlue,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    JournalingReminderView()
}
