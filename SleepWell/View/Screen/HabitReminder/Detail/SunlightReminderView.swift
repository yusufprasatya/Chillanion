//
//  DetailHabitReminderView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import SwiftUI
import Foundation

struct SunlightReminderView: View {
    @State private var isReminderActive: Bool =  false
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject private var userViewModel = UserViewModel()
    @ObservedObject private var reminderViewModel = ReminderViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blackRegular, .blackRegular]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack (spacing: 25){
                ZStack {
                    //                    Rectangle()
                    //                        .fill(LinearGradient(gradient: Gradient(colors: [.navyBlue, .paleAqua]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    //                        .frame(width: .infinity, height: 250)
                    //                        .cornerRadius(10)
                    //                        .padding(.top, 10)
                    Image("sunlightbg")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 342, height: 305)
                        .padding(.top, 10)
                      
//                    VStack (alignment: .leading) {
//                        Text("Sunlight")
//                            .font(.system(size: 28, weight: .bold, design: .rounded))
//                            .foregroundColor(.white)
//                        
//                        Text("️☀️ Early Outdoor Exposure: ")
//                            .font(.system(size: 18, weight: .bold, design: .rounded))
//                            .foregroundColor(.white)
//                        Text("️Step outside within 2 hours of waking up. ")
//                            .font(.system(size: 16, weight: .regular, design: .rounded))
//                            .foregroundColor(.white)
//                            .padding(.bottom, 20)
//                        
//                        Text("️☀️ Natural Light Magic: ")
//                            .font(.system(size: 18, weight: .bold, design: .rounded))
//                            .foregroundColor(.white)
//                        Text("️ Sunlight syncs your body's internal clock, boosting alertness and mood. ")
//                            .font(.system(size: 16, weight: .regular, design: .rounded))
//                            .foregroundColor(.white)
//                            .padding(.bottom, 20)
//                        Text("️✨ Start Your Day Right:  ")
//                            .font(.system(size: 18, weight: .bold, design: .rounded))
//                            .foregroundColor(.white)
//                        Text("️ Experience the magic of the outdoors,and start with a smile! 😊🌞 ")
//                            .font(.system(size: 16, weight: .regular, design: .rounded))
//                            .foregroundColor(.white)
//                            .padding(.bottom, 20)
//
//                    }
                   
                    
                }
                
                VStack(alignment: .leading) {
                    Toggle(isOn:  $reminderViewModel.isRemind, label: {
                        Text("Remind me ")
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                        Text("To get sunlight exposure")
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
                            let reminder = ReminderModel(name: "Sunlight", category: "day activity", remindTime: date15MinutesFromWakeUp!, isRemind: true)
                           
                                PersistenceController.shared.saveReminder(reminder: reminder)
                            UserNotificationService.shared.scheduleNotification(type: "date", timeInterval: nil, title: "Sunlight", body: "Rise and shine, gorgeous! Get 15-minutes sunlight to start your day brighter and have a better mood!🌤️", notifHour: triggerDateComponents)
                            self.presentationMode.wrappedValue.dismiss()
                        },
                        backgroundColor: .primaryButton,
                        foregroundColor: .white,
                        cornerRadius: 15)
                }
                .padding(.horizontal, 20)
                .onAppear{
                    
                }
            }
            .padding()
            .navigationTitle("Sunlight")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Color.darkBlue,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    SunlightReminderView()
}
