//
//  CaffeineReminderView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import SwiftUI

struct CaffeineReminderView: View {
    @State private var isReminderActive: Bool = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.darkBlue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 23) {
                ZStack {
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.navyBlue, .paleAqua]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: .infinity, height: 250)
                        .cornerRadius(10)
                        .padding(.top, 10)
                    HStack {
                        VStack (alignment: .leading) {
                            Text("Stop Caffeine")
                                .font(.system(size: 28, weight: .bold, design: .rounded))
                            
                            Text("lorem ipsum dolor siamet")
                                .font(.system(size: 17, weight: .regular, design: .rounded))
                        }
                        Text("☕️")
                            .font(.system(size: 150, weight: .semibold, design: .rounded))
                    }
                }
                
                VStack(alignment: .leading) {
                    Toggle(isOn: $isReminderActive, label: {
                        Text("Remind me ")
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                        Text("To stop caffeine intake")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                    })
                    
                    
                    Text("Reminder time")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 23)
                    Text("6 hour before bedtime")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                    Spacer()
                    RoundedButton(
                        title: "Done",
                        action: {},
                        backgroundColor: .primaryButton,
                        foregroundColor: .white,
                        cornerRadius: 15)
                }
                .padding(.horizontal, 20)
            }
            .navigationTitle("Stop Caffeine")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Color.darkBlue,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    CaffeineReminderView()
}
