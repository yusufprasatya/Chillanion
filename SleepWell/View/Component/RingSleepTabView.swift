//
//  RingSleepView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 08/11/23.
//

import SwiftUI

struct RingSleepTabView: View {
    @EnvironmentObject var weekStore: WeekStore
    @Binding var activeTab: Int
    @Binding var sleepTabRing: Int
    @Binding var dataSleep: [SleepEntry]
    @State private var direction: TimeDirection = .unknown
    @State private var isDateChange = false
    @State private var bedTimeCommitment = Date()
    @State private var wakeUpTime = Date()
    @State private var previousActiveTab: Int = 0
    @State private var SleepBarProgress: Double = 0.0
    @State private var onTapGesture: Bool = false
    @State private var percentageOfSleep = 0.0
    @State private var showFullScreenCover = false
    @State private var actualBedTime: Date = Date()
    @State private var actualWakeUp: Date = Date()
    @State private var commitmentWakeUp: Date = Date()
    @State private var commitmentBedTime: Date = Date()
    @State private var isAlertPresented: Bool =  false
    
    @State private var timeLateWakeUp: (hours: Int, minutes: Int) = (hours: 0, minutes: 0)
    @State private var timeLateBedTime: (hours: Int, minutes: Int) = (hours: 0, minutes: 0)
    
    @GestureState private var gestureOffset: CGFloat = 0
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\TodaysHabit.date)])
    private var todaysHabit: FetchedResults<TodaysHabit>
    
    @EnvironmentObject var sleepManager: SleepManager
    @ObservedObject private var userViewModel = UserViewModel()
    @ObservedObject private var healthManager = HealthManager()
    var sleepFilter = SleepFilter()
    @State private var sleepEntry: [SleepEntry] = []
    var body: some View {
        
        return ScrollView {
            ZStack {
                switch SleepBarProgress {
                case 0.25..<0.50:
                    Image("koalaSoso")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 130, height: 130)
                        .padding(.top, 50)
                        .padding(.leading, 12)
                case 0.50..<0.75:
                    Image("koalaGood")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 130, height: 130)
                        .padding(.top, 50)
                        .padding(.leading, 12)
                case 0.75...2.0:
                    Image("koalaHappy")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 130, height: 130)
                        .padding(.top, 50)
                        .padding(.leading, 12)
                default:
                    Image("KoalaSad")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 130, height: 130)
                        .padding(.top, 50)
                        .padding(.leading, 12)
                }
                ProgressBar(progress: $SleepBarProgress , lineWidth: .constant(30))
                    .frame(width: 274, height: 274)
                    .padding(.leading, 10)
                    .padding(.top, 50)
            }
            .background(Image("starsProfile").resizable().scaledToFit().ignoresSafeArea())
            .padding()
            .onAppear{
                userViewModel.getUser()
                //get wakeUp and bedTime from user db
                wakeUpTime = userViewModel.wakeUpTime
                bedTimeCommitment = userViewModel.bedTimeCommitment
            }
            .onChange(of: activeTab) { val in
                if val > previousActiveTab {
                    direction = .future
                } else if val < previousActiveTab {
                    direction = .past
                }
                
                
                let calendar = Calendar.current
                let actualBedTimeTmp = DateUtil.combineDateWithSelectedTime(specificDate: bedTimeCommitment, selectedDate: weekStore.selectedDate) ?? Date()
                
                withAnimation(Animation.easeInOut(duration: 2.0)) {
                    commitmentWakeUp = DateUtil.combineDateWithSelectedTime(specificDate: wakeUpTime, selectedDate: weekStore.selectedDate) ?? Date()
                    commitmentBedTime = calendar.date(byAdding: .day, value: -1, to: actualBedTimeTmp) ?? Date()
                    sleepEntry = sleepFilter.filteringSleepDaily(sleepData: sleepManager.sleepData, selectedDay: weekStore.selectedDate, startOfOpeningHours: commitmentBedTime, endOfOpeningHours: commitmentWakeUp.addingTimeInterval(10 * 60 * 60))
                    if !sleepEntry.isEmpty {
                        actualBedTime = sleepEntry.first!.startDate
                        actualWakeUp = sleepEntry.last!.endDate
                    }
                    
                    timeLateBedTime = DateUtil.calculateTotalHoursAndMinutes(startDate: commitmentBedTime , endDate: actualBedTime)
                    timeLateWakeUp = DateUtil.calculateTotalHoursAndMinutes(startDate: actualWakeUp , endDate:  commitmentWakeUp)
                    
                    percentageOfSleep = SleepUtil.calculatePercentageSleep(yourSleep: sleepFilter.getTotalDurationSleep(sleepData: sleepEntry), sleepTime: wakeUpTime.timeIntervalSince(bedTimeCommitment))
                    
                    SleepBarProgress = sleepFilter.getTotalDurationSleep(sleepData: sleepEntry)
                                   / wakeUpTime.timeIntervalSince(bedTimeCommitment)
                }
                
            }
            Group {
                Text("Sleep duration")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                Text("\(DateUtil.formatDoubleToString(param: percentageOfSleep))%")
                    .font(.system(size: 32, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.bottom, 46)
                
                if sleepManager.sleepData.isEmpty {
                    Text("Whoops, Chilla can’t give you your \nsleep data. Allow Chilla to get \npermission to access your data health!")
                        .font(.caption)
                        .fontWeight(.medium)
                        .fontDesign(.rounded)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, -30)
                    
                    RoundedButton(title: "Allow data health", action: {
                        isAlertPresented.toggle()
                    }, backgroundColor: .primaryButton, foregroundColor: .white, cornerRadius: 15)
                    .padding(.top, 45)
                    .padding(.bottom, 80)
                    .alert(isPresented: $isAlertPresented) {
                        Alert(
                            title: Text("“Chilla” Would Like to Access Your Health Data"),
                            message: Text("This lets Chilla to personalized your needed information"),
                            primaryButton: .default(
                                Text("Ok"),
                                action: {
                                    healthManager.requestHealthAuthorizationForSleep { health in
                                        print("Masoook \(health)")
                                    }
                                }
                            ),
                            secondaryButton: .cancel(
                                Text("Don't Allow"),
                                action: {
                                    // Handle access denied here
                                }
                            )
                        )
                    }
                }
            }
            VStack{
                HStack {
                    
                    TimeView(title: "Sleep", time: actualBedTime, commitmentTime: commitmentBedTime, timeLate: TimeDifference(hours: timeLateBedTime.hours, minutes: timeLateBedTime.minutes), colorCommitment: Color.forestGreen)
                    Spacer()
                    TimeView(title: "Wake-up", time: actualWakeUp, commitmentTime: commitmentWakeUp, timeLate: TimeDifference(hours: timeLateWakeUp.hours, minutes: timeLateWakeUp.minutes), colorCommitment: Color.forestGreen)
                }
                .padding(.bottom)
                LinearGradient(gradient: Gradient(colors: [.paleLavender, .softYellow]), startPoint: .top, endPoint: .bottom)
                    .frame(width: 344, height: 1)
                    .padding()
                
                VStack {
                    Text("Habit Tracker")
                        .font(.title3)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .foregroundColor(.white)
                        .padding(.top)
                        .padding(.bottom, 2)
                        .padding(.leading, -170)
                    
                    if todaysHabit.filter({ $0.date!.isInSameDay(as: weekStore.selectedDate) }).isEmpty {
                        koalaSadView()
                        Text("You haven't marked any habits as done.")
                            .font(.headline)
                            .fontWeight(.medium)
                            .fontDesign(.rounded)
                            .foregroundColor(.white)
                    } else {
                        ForEach(todaysHabit) { isHabitFinished in
                            if isHabitFinished.date!.isInSameDay(as: weekStore.selectedDate) {
                                ListItem(icon: isHabitFinished.icon ?? "", title: isHabitFinished.name ?? "")
                                    .padding(.leading, -170)
                            }
                        }
                    }
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
        .scrollIndicators(.hidden)
    }
}

extension RingSleepTabView {
    @ViewBuilder
    private func koalaSadView() -> some View {
        HStack {
            Spacer()
            Image("KoalaSad")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Spacer()
        }
    }
    
}
//#Preview {
//    RingSleepTabView(activeTab: <#Binding<Int>#>, sleepTabRing: <#Binding<Int>#>, dataSleep: <#Binding<[SleepEntry]>#>)
//}
