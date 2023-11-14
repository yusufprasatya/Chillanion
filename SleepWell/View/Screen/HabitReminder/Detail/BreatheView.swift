//
//  SwiftUIView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import SwiftUI

struct BreatheView: View {
    @State private var isReminderActive: Bool = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blackRegular, .blackRegular]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 23) {
                ZStack {
//                    Rectangle()
//                        .fill(LinearGradient(gradient: Gradient(colors: [.slateBlue, .teal]), startPoint: .topLeading, endPoint: .bottomTrailing))
//                        .frame(width: .infinity, height: 250)
//                        .cornerRadius(10)
//                        .padding(.top, 10)
                    Image("breathbg")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 342, height: 342)
                        .padding(.top, 10)

//                    VStack (alignment: .leading) {
//                        Text("Breathe")
//                            .font(.system(size: 28, weight: .bold, design: .rounded))
//                            .foregroundColor(.white)
//                       
//                        Text("️ *. Stress Relief: Embrace this simple routine as your daily stress-buster. \n*. Relaxation and Focus: It's your secret to a more relaxed mind and improved focus, even when you're tired or feeling moody from lack of sleep. \n*. Positivity and Productivity: Make it a habit for a brighter mood and increased productivity. 😌😊")
//                            .font(.system(size: 16, weight: .regular, design: .rounded))
//                            .foregroundColor(.white)
//                            .padding(.bottom, 20)
//                        
//                        
//                    }
//                    .frame(width: 330)
//                    .padding()
//                    HStack {
//                        VStack (alignment: .leading) {
//                            Text("Power Nap")
//                                .font(.system(size: 28, weight: .bold, design: .rounded))
//
//                            Text("lorem ipsum dolor siamet")
//                                .font(.system(size: 17, weight: .regular, design: .rounded))
//                        }
//                        Text("😴")
//                            .font(.system(size: 150, weight: .semibold, design: .rounded))
//                    }
                }
                
                VStack(alignment: .leading) {
                    Toggle(isOn: $isReminderActive, label: {
                        Text("Remind me ")
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                        Text("To take a breath")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                    })
                    
                    Text("Reminder time")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 23)
                    Text("Once an hour")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                    Spacer()
                    RoundedButton(
                        title: "Done",
                        action: {
                            
                            let reminder = ReminderModel(name: "Breathe", category: "Day activity", remindTime: Date(), isRemind: true)
                            
                            let notifEveryThreeHours: TimeInterval = 3600
                            PersistenceController.shared.saveReminder(reminder: reminder)
                            UserNotificationService.shared.scheduleNotification(type: "time", timeInterval: notifEveryThreeHours, title: "Breathe", body: "Seems like you were short of sleep last night! Take a 20-minute power nap to power up your energy!⚡️", notifHour: nil)
                            self.presentationMode
                                .wrappedValue
                                .dismiss()},
                        backgroundColor: .primaryButton,
                        foregroundColor: .white,
                        cornerRadius: 15)
                }
                .padding(.horizontal, 20)
            }
            .padding()
            .navigationTitle("Breathe")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Color.darkBlue,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    BreatheView()
}
