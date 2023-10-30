//
//  SleepReminderView.swift
//  SleepWell
//
//  Created by Billbert Pohandy on 25/10/23.
//

import SwiftUI

struct SleepReminderView: View {
    @State private var isAlarmEnabled = false

    var body: some View {
        VStack{
            Text("Sleep Reminder")
                .foregroundStyle(Color.white)
                .fontWeight(.bold)
                .font(.system(size: 34))
            .frame(width: 334, alignment: .leading)
           
         
            ZStack{
                Image("CalculationImage")
                    .resizable()
                    .frame(width: 218, height: 218)
                Text("22.30")
                    .foregroundStyle(Color.white)
                    .fontWeight(.semibold)
                    .font(.system(size: 40))
                    .frame(width: 109, height: 22)
            }
            .padding(.top, 51)
            .padding(.bottom, 56)
            HStack{
                ZStack{
                    Image("BedtimeBackground")
                        .resizable()
                        .frame(width: 165, height: 82.75)
                    Text("22.30")
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .padding(.top, 40)
                        .padding(.leading, -70)
                }
                ZStack{
                    Image("WakeUpBackground")
                        .resizable()
                        .frame(width: 165, height: 82.75)
                    Text("06.00")
                        .foregroundStyle(Color.black)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .padding(.top, 40)
                        .padding(.leading, -70)
                }
            }
            .padding(.bottom, 17.25)
            ZStack {
                           Rectangle()
                               .fill(Color.rectanglebg) // Adjust the color as needed
                               .frame(width: 342, height: 70) // Adjust the size as needed
                               .cornerRadius(10)
                HStack{
                    Spacer()
                    Text("Sleep goals")
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                        .font(.system(size: 17))
                   Spacer()
                    Text("6 hours 15 minutes")
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                        .font(.system(size: 17))
                    Spacer()
                }
               
                       }
            ZStack {
                           Rectangle()
                               .fill(Color.rectanglebg) // Adjust the color as needed
                               .frame(width: 342, height: 70) // Adjust the size as needed
                               .cornerRadius(10)
                HStack{
                    Spacer(minLength: 50)
                    Toggle(isOn: $isAlarmEnabled) {
                        Text("Alarm")
                    }
                    .foregroundStyle(Color.white)
                    .fontWeight(.bold)
                    .font(.system(size: 17))
                    Spacer(minLength: 47)
                }
                       }
        }
        .background(
            Image("ReminderBackground")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            )
    }
}

#Preview {
    SleepReminderView()
}
