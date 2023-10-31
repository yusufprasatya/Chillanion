//
//  DimTheLightReminderView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import SwiftUI

struct DimTheLightReminderView: View {
    @State private var isReminderActive: Bool = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.darkBlue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 23) {
                ZStack {
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.midnightBlue, .paleAqua]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: .infinity, height: 250)
                        .cornerRadius(10)
                        .padding(.top, 10)
                    HStack {
                        VStack (alignment: .leading) {
                            Text("Dim the light")
                                .font(.system(size: 28, weight: .bold, design: .rounded))
                            
                            Text("lorem ipsum dolor siamet")
                                .font(.system(size: 17, weight: .regular, design: .rounded))
                        }
                        Text("🛋️")
                            .font(.system(size: 150, weight: .semibold, design: .rounded))
                    }
                }
                
                VStack(alignment: .leading) {
                    Toggle(isOn: $isReminderActive, label: {
                        Text("Remind me on these days ")
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                        Text("To dim the room light ")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                    })
                
                    Text("Reminder time")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 23)
                    Text("2 hour before bed time")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                    Spacer()
                    RoundedButton(
                        title: "Done",
                        action: {
//                            UserNotificationService.shared.scheduleNotification(type: "time", title: "Sunlight", body: "Rise and shine, gorgeous! Get 15-minutes sunlight to start your day brighter and have a better mood!🌤️", notifHour: nil)
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
            .navigationTitle("Dim the light")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Color.darkBlue,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    DimTheLightReminderView()
}
