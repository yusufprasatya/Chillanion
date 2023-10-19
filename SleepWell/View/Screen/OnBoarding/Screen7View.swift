//
//  Screen11View.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 17/10/23.
//

import SwiftUI

struct Screen11View: View {
    @State private var selectedDate: Date = Date()
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            VStack (spacing: 20) {
                Image("koalaInTheMoon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 189, height: 180)
                
                Text("What time do you usually go to bed?")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                    .padding(.top, 45)
                    .padding(.leading, 0)
                VStack {
                    DatePicker("Select a Time", selection: $selectedDate, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                        .frame(width: 200)
                        .background(.clear)
                        .colorScheme(.dark)
                        .cornerRadius(13)
                }
                Spacer()
                RoundedButton(title: "Continue",
                              action: {},
                              backgroundColor: .paleLavender,
                              foregroundColor: .black,
                              cornerRadius: 15)
            }
            .padding()
        }
    }
}

#Preview {
    Screen11View()
}
