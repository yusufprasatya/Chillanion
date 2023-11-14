//
//  MealReminderView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import SwiftUI

struct MealReminderView: View {
    @State private var isReminderActive: Bool = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.darkBlue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 23) {
                ZStack {
                    Image("stoplatemealbg")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 342, height: 305)
                        .padding(.top, 24)
                }
                
                VStack(alignment: .leading) {
                    Toggle(isOn: $isReminderActive, label: {
                        Text("Remind me on these days ")
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                        Text("To stop my meals")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                    })
                
                    
                    Text("Reminder time")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 23)
                    Text("3 hours before bedtime😍")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                
                    Spacer()
                    RoundedButton(
                        title: "Done",
                        action: {
                            UserNotificationService.shared.scheduleNotification(type: "date", timeInterval: nil, title: "Late Meals", body: "Let your body rest at night Stop eating four hours before sleep to ensure sweet dreams and uninterrupted Zzz's! 😴🌙", notifHour: nil)
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
            .navigationTitle("Stop Late Meal")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Color.darkBlue,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    MealReminderView()
}
