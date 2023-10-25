//
//  Screen6View.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 18/10/23.
//

import SwiftUI

struct Screen6notView: View {
    @Binding var screen: Int
    @Binding var bedTime: Date
   
    var body: some View {
        VStack (alignment: .leading) {
            HStack{
                Spacer()
                Image("koalaInTheMoon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 154, height: 146)
                    .border(.red)
                    .padding(.leading, -50)
                    .padding(.top, -10)
                Spacer()
            }
            
            Text("What time do you usually go to bed?")
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
                .padding(.top, 28)
                .padding(.leading, 0)
                .border(.red)
            HStack{
                Spacer()
                VStack {
                    DatePicker("Select a Time", selection: $bedTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                        .frame(width: 200)
                        .background(.clear)
                        .colorScheme(.dark)
                        .cornerRadius(13)
                }
                Spacer()
            }
            .padding(.top, 48)
            .border(.red)
            Spacer()
            RoundedButton(title: "Continue",
                          action: {
                screen += 1
            },
                          backgroundColor: .paleLavender,
                          foregroundColor: .black,
                          cornerRadius: 15)
            .border(.red)
        }
        .border(.red)
        .padding()
        .padding(.horizontal)
    }
}
