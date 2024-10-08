//
//  WeekView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 07/11/23.
//

import SwiftUI

struct WeekView: View {
    @EnvironmentObject var weekStore: WeekStore
    @State private var isDateNow = false
    @State private var selectedDate = Date()
    @State private var bedTimeCommitment = Date()
    @State private var wakeUpTime = Date()
    @Binding var activeTab: Int
    @Binding var sleepTabRing: Int
    @State private var sleepBarProgress: Double = 0.0
    var sleepFilter = SleepFilter()
    @EnvironmentObject var sleepManager: SleepManager
    @ObservedObject private var userViewModel = UserViewModel()
    
    @State private var sleepEntry: [SleepEntry] = []
    var week: Week
    var body: some View {
        LazyHStack {
            ForEach(0..<7) { i in
                VStack {
                    ZStack {
                        if Calendar.current.isDate(week.dates[i], inSameDayAs: Date()) {
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.BarIconColor)
                                .offset(y: -28)
                        }
                        if (week.dates[i] == week.referenceDate) {
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.white)
                                .offset(y: -28)
                        }
                        Button(action: {
                            print("activeView \(activeTab)")
                            withAnimation () {
                                activeTab = i
                                weekStore.selectedDate = week.dates[i]
                                print("ini keberapo 2")
                            }
                        }, label: {
                            Text(week.dates[i].toString(format: "E").uppercased().prefix(1))
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundColor(week.dates[i] > Date() ? Color.white.opacity(0.5) :.white)
                                .frame(width: 42, height: 42)
                                .background(week.dates[i] > Date() ? Color.black
                                    .overlay(Color.black.opacity(0.3)) : Color.paleSkyBlue
                                    .overlay(Color.black.opacity(0.5)))
                                .cornerRadius(50)
                                .overlay(content: {
                                    let calendar = Calendar.current
                                
                                    let actualBedTimeTmp = DateUtil.combineDateWithSelectedTime(specificDate: bedTimeCommitment, selectedDate: week.dates[i]) ?? Date()
                                    let actualWakeUp = DateUtil.combineDateWithSelectedTime(specificDate: wakeUpTime, selectedDate: week.dates[i]) ?? Date()
                                    
                                    let actualBedTime = calendar.date(byAdding: .day, value: -1, to: actualBedTimeTmp) ?? Date()
                                    
                                    ProgressBar(progress: .constant(sleepFilter.getTotalDurationSleep(sleepData: sleepFilter.filteringSleepDaily(sleepData: sleepManager.sleepData, selectedDay: week.dates[i], startOfOpeningHours: actualBedTime, endOfOpeningHours: actualWakeUp.addingTimeInterval(10 * 60 * 60)))
                                                                    / wakeUpTime.timeIntervalSince(bedTimeCommitment)) , lineWidth: .constant(5))
                                    
                                    .opacity(week.dates[i] == week.referenceDate ? 1.0 : 0.5)
                                        .frame(width: 42, height: 42)
                                })
                        })
                        .disabled(week.dates[i] > Date() ? true : false)
                    }
                    .shadow(radius: 5)
                    .frame(maxWidth: .infinity)
                }
                .onAppear{
                    userViewModel.getUser()
                    wakeUpTime = userViewModel.wakeUpTime
                    bedTimeCommitment = userViewModel.bedTimeCommitment
                }
            }
        }
        .padding(.horizontal, 5)
    }
}
