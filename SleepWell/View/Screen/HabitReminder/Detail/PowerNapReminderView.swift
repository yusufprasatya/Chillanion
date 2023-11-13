//
//  SwiftUIView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import SwiftUI

struct PowerNapReminderView: View {
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
                    Image("powernapbg")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 342, height: 305)
                        .padding(.top, 10)//
//                        .overlay(
//                            // Skip Button
//                            Text("😴")
//                                .font(.system(size: 150, weight: .semibold))
//                            , alignment: .topTrailing
//                        )
//                    VStack (alignment: .leading) {
//                        Text("Power Nap")
//                            .font(.system(size: 28, weight: .bold, design: .rounded))
//                            .foregroundColor(.white)
//                        
//                        Text("️⚡️ Boost with Power Naps:  ")
//                            .font(.system(size: 18, weight: .bold, design: .rounded))
//                            .foregroundColor(.white)
//                        Text("️ Use short naps to recharge and improve focus in the daytime.")
//                            .font(.system(size: 16, weight: .regular, design: .rounded))
//                            .foregroundColor(.white)
//                            .padding(.bottom, 20)
//                        
//                        Text("️😌 Mindful Nap Length:  ")
//                            .font(.system(size: 18, weight: .bold, design: .rounded))
//                            .foregroundColor(.white)
//                        Text("️ Keep them brief to avoid disrupting your nighttime sleep.")
//                            .font(.system(size: 16, weight: .regular, design: .rounded))
//                            .foregroundColor(.white)
//                            .padding(.bottom, 20)
//                        
//                        
//                        Text("️🌈 Sweet Dreams All Night:  ")
//                            .font(.system(size: 18, weight: .bold, design: .rounded))
//                            .foregroundColor(.white)
//                        Text("️ Your nighttime sleep remains undisturbed! 💤😴")
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
                        Text("To take a power nap")
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
                            
                            UserNotificationService.shared.scheduleNotification(type: "date", timeInterval: nil, title: "Power Nap", body: "Seems like you were short of sleep last night! Take a 20-minute power nap to power up your energy!⚡️", notifHour: nil)
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
            .navigationTitle("Power Nap")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Color.darkBlue,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    PowerNapReminderView()
}
