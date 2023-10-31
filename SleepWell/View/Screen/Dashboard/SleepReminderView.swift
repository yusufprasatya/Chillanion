//
//  SleepReminderView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 29/10/23.
//

import SwiftUI

struct SleepReminderView: View {
    @State private var isAlarmEnabled = false
    @State private var sleepGoals: TimeInterval = 0
    @Binding var bedTimeCommitment: Date
    @Binding var wakeUpTime: Date
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
                Text("\(DateUtil.formatDateToString(param: bedTimeCommitment))")
                    .foregroundStyle(Color.white)
                    .fontWeight(.semibold)
                    .font(.system(size: 28))
                    .frame(width: 109, height: 22)
            }
            .padding(.top, 51)
            .padding(.bottom, 56)
            HStack{
                ZStack{
                    Image("BedtimeBackground")
                        .resizable()
                        .frame(width: 165, height: 82.75)
                    Text("\(DateUtil.formatDateToString(param: bedTimeCommitment))")
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
                    Text("\(DateUtil.formatDateToString(param: wakeUpTime))")
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
                    HStack{
                        let (hours, minutes) = DateUtil.extractNumbers(from: DateUtil.humanReadableHour(data: sleepGoals))
                        Text("\(hours)")
                            .foregroundStyle(Color.white)
                            .fontWeight(.bold)
                            .font(.system(size: 17))
                        Text("hours")
                            .foregroundStyle(Color.white)
                            .fontWeight(.bold)
                            .font(.system(size: 17))
                        Text("\(minutes)")
                            .foregroundStyle(Color.white)
                            .fontWeight(.bold)
                            .font(.system(size: 17))
                        Text("minutes")
                            .foregroundStyle(Color.white)
                            .fontWeight(.bold)
                            .font(.system(size: 17))
                    }
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
        .onAppear{
            sleepGoals = wakeUpTime.timeIntervalSince(bedTimeCommitment)
            let (hours, minutes) = DateUtil.extractNumbers(from: DateUtil.humanReadableHour(data: sleepGoals))
            print("\(hours) hours \(minutes) minutes")
            
        }
    }
}

#Preview {
    SleepReminderView(bedTimeCommitment: .constant(Date()), wakeUpTime: .constant(Date()))
}
