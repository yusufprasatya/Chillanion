////
////  DashboardView.swift
////  SleepWell
////
////  Created by Muhammad Yusuf on 25/10/23.
////
//
//import Foundation
//import SwiftUI
//
//// created by Bilbert Pohandy
//struct DashboardView: View {
//    @State private var SleepBarProgress: Double = 0.0
//    @State private var StepBarProgress: Double = 0.0
//    @State private var isStayHydrated = false
//    @State private var isNapSelected = false
//    @State private var isJournalingSelected = false
//    @State private var showAlert = false
//    @State private var selectedHabitName: String = ""
//    @State private var isReadyToSave: Bool = false
//    
//    @ObservedObject private var userViewModel = UserViewModel()
//    @ObservedObject private var stepService = StepService()
//    @EnvironmentObject var sleepManager: SleepManager
//    var sleepFilter = SleepFilter()
//    
//    @State private var todaysStepCount: Double = 0.0
//    @State private var percentageOfSleep = 0.0
//    @State private var isSleepDurationGood = false
//    @State private var bedTimeCommitment = Date()
//    @State private var wakeUpTime = Date()
//    @State private var name = ""
//    @State private var habitSelected: String = ""
//    @State private var timeBeforeSleep: String = ""
//    
//    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)])
//    private var habitsEntries: FetchedResults<DailyHabits>
//    @State var selectedHabit: [String: Bool] = [:]
//    
//    let sleepQualityData: [Double] = [8, 7, 9, 8, 9, 7, 8]
//    
//    var body: some View {
//        NavigationStack{
//            ScrollView {
//                ZStack {
//                    VStack(alignment: .leading) {
//                        HStack{
//                            VStack{
//                                Text("Hi, \(name)")
//                                    .font(.largeTitle)
//                                    .fontDesign(.rounded)
//                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                                    .foregroundStyle(Color.white)
//                                    .padding(.top, -15)
//                                    .fixedSize(horizontal: true, vertical: false)
//                                    .frame(width: 110, alignment: .leading)
//                                Text("Your last\nnight's sleep:")
//                                    .foregroundStyle(Color.white)
//                                    .fontWeight(.bold)
//                                    .font(.system(size: 17))
//                                    .multilineTextAlignment(.leading)
//                                    .lineLimit(2)
//                                    .padding(.top, 6)
//                                let sleepPercentage = calculatePercentageSleep(yourSleep: sleepFilter.getTotalDurationSleep(sleepData: sleepManager.sleepData), sleepTime: wakeUpTime.timeIntervalSince(bedTimeCommitment))
//                                Text("\(DateUtil.formatDoubleToString(param: sleepPercentage))%")
//                                    .foregroundStyle(Color.white)
//                                    .fontWeight(.bold)
//                                    .font(.system(size: 32))
//                                    .multilineTextAlignment(.leading)
//                                    .padding(.top, 6)
//                                    .frame(width: 110, alignment: .leading)
//                            }
//                            Spacer()
//                            ZStack {
//                                CircularBarView(progress: $SleepBarProgress)
//                                switch SleepBarProgress {
//                                case 0.25..<0.50:
//                                    Image("koalaSoso")
//                                        .resizable()
//                                        .frame(width: 133, height: 96)
//                                        .padding(.top, 50)
//                                        .padding(.leading, 12)
//                                case 0.50..<0.75:
//                                    Image("koalaGood")
//                                        .resizable()
//                                        .frame(width: 133, height: 96)
//                                        .padding(.top, 50)
//                                        .padding(.leading, 12)
//                                case 0.75...2.0:
//                                    Image("koalaHappy")
//                                        .resizable()
//                                        .frame(width: 133, height: 96)
//                                        .padding(.top, 50)
//                                        .padding(.leading, 12)
//                                default:
//                                    Image("KoalaSad")
//                                        .resizable()
//                                        .frame(width: 133, height: 96)
//                                        .padding(.top, 50)
//                                        .padding(.leading, 12)
//                                }
//                            }
//                        }
//                        .overlay(
//                            Text("Based on your commitment")
//                                .foregroundStyle(Color.white)
//                                .font(.system(size: 16, weight: .regular, design: .rounded))
//                                .offset(x: -73,y: 100)
//                        )
//                        Spacer(minLength: 40)
//                        NavigationLink(destination: SleepReminderView( bedTimeCommitment: $bedTimeCommitment, wakeUpTime: $wakeUpTime), label: {
//                            ZStack{
//                                Image("SleepGoal")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 342, height: 157)
//                                Text("\(DateUtil.formatDateToString(param: bedTimeCommitment))")
//                                    .foregroundStyle(Color.white)
//                                    .fontWeight(.bold)
//                                    .font(.system(size: 40))
//                                    .padding(.leading, -150)
//                                    .padding(.top, 16)
//                                Text("It’s 6 hours before sleep!")
//                                    .foregroundStyle(Color.white)
//                                    .font(.system(size: 17, weight: .medium, design: .rounded))
//                                    .offset(x:-53, y: 50)
//                            }
//                        })
//                        Image("chillatips")
//                            .frame(width: 342, height: 168)
//                            .padding(.bottom, 18)
//                            .offset(y: -10)
//                        Text("Day Activity☀️")
//                            .font(.system(size: 20))
//                            .foregroundStyle(Color.white)
//                            .fontWeight(.bold)
//                            .padding(.leading, 5)
//                            .padding(.top, -10)
//                        NavigationLink(destination: TodayStepView(todayStep: $todaysStepCount), label: {
//                            ZStack{
//                                Image("StepBackground")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 342, height: 157)
//                                    .padding(.top, -5)
//                                HStack{
//                                    Spacer()
//                                    Text("\(DateUtil.formatDoubleToString(param: todaysStepCount))")
//                                        .font(.system(size: 34))
//                                        .fontWeight(.bold)
//                                        .foregroundColor(Color.white)
//                                    + Text("/4500 step")
//                                        .font(.system(size: 17))
//                                        .foregroundColor(Color.white)
//                                    Spacer()
//                                    
//                                    StepProgressBar(stepprogress: $StepBarProgress, lineWidth: 15)
//                                        .frame(width: 100, height: 100)
//                                    Spacer()
//                                }
//                            }
//                        })
//                        ForEach(habitsEntries.filter { $0.isRemind }) { dailyHabit in
//                            CustomViewButton(
//                                icon: dailyHabit.icon ?? "",
//                                title: dailyHabit.name ?? "",
//                                desc: dailyHabit.desc ?? "",
//                                isSelected: selectedHabit[dailyHabit.name ?? ""] ?? false
//                            ) {
//                                selectedHabit[dailyHabit.name ?? ""] = true
//                            }
//                            .onChange(of: selectedHabit[dailyHabit.name ?? ""]) { val in
//                                print("Onchang \(dailyHabit.name) \(selectedHabit[dailyHabit.name ?? ""])")
//                                if selectedHabit[dailyHabit.name ?? ""] == true{
//                                    print("Save Data \(Date()), \(dailyHabit.name), \(dailyHabit.icon), \(dailyHabit.desc)")
//                                    
//                                    let todaysHabit = TodayHabit(name: dailyHabit.name!, icon: dailyHabit.icon!, desc: dailyHabit.desc!, isDone: true, date: Date())
//                                    
//                                    PersistenceController.shared.saveTodaysHabit(todaysHabit: todaysHabit)
//                                }
//                            }
//                            .disabled(selectedHabit[dailyHabit.name ?? ""] ?? false)
//                        }
//
////                        ForEach(habitsEntries) { dailyHabit in
////                            var habitName: String = dailyHabit.name ?? ""
////                            if dailyHabit.isRemind {
////                                CustomViewButton(
////                                    icon: dailyHabit.icon ?? "",
////                                    title: dailyHabit.name ?? "",
////                                    desc: dailyHabit.desc ?? "",
////                                    isSelected: selectedHabit[dailyHabit.name ?? ""] ?? false
////                                ) {
////                                    
////                                    if selectedHabit[dailyHabit.name ?? ""] ?? false {
////                                        selectedHabit[dailyHabit.name ?? ""] = false
////                                    } else {
////                                        showAlert = true
////                                    }
////                                }
////                                .alert(isPresented: $showAlert) {
////                                    Alert(
////                                        title: Text("Mark as Done"),
////                                        message: Text("Are you sure you want to mark \(selectedHabitName) as done?"),
////                                        primaryButton: .destructive(Text("Yes")) {
////                                            if habitName != dailyHabit.name {
////                                                selectedHabit[dailyHabit.name ?? ""] = true
////                                            }
////                                        },
////                                        secondaryButton: .cancel()
////                                    )
////                                }
////                                .disabled(selectedHabit[dailyHabit.name ?? ""] ?? false)
////                            }
////                        }
//                        
//                        //                    ZStack{
//                        //                        Image("SleepActivity")
//                        //                            .resizable()
//                        //                            .scaledToFill()
//                        //                           /* .frame(width: UIScreen.main.bounds.width - 10)*/ // Adjust the image width if needed
//                        //                        SleepQualityBarChart(data: sleepQualityData, showDayLabels: false)
//                        //                            .padding(.top, 20)
//                        //                            .padding(.horizontal, 20)
//                        //                    }
//                        
//                        NavigationLink(destination: JournalView(), label: {
//                            Image("JournalBackground")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 342, height: 157)
//                                .padding(.top, 35)
//                        })
//                    }
//                    .padding(.horizontal, 40)
//                    .background(
//                        Image("MainBackground")
//                            .resizable()
//                            .scaledToFill()
//                            .ignoresSafeArea(.all)
//                    )
//                }
//                .transition(.move(edge: .trailing))
//                .onAppear {
//                    userViewModel.getUser()
//                    
//                    // Update UI-related data on the main queue
//                    name = userViewModel.name
//                    wakeUpTime = userViewModel.wakeUpTime
//                    bedTimeCommitment = userViewModel.bedTimeCommitment
//                    
//                    // Fetch today's steps asynchronously
//                    stepService.getTodaysSteps { step in
//                        // Update UI-related data on the main queue
//                        DispatchQueue.main.async {
//                            todaysStepCount = step
//                        }
//                    }
//                    print("tidur jam \(bedTimeCommitment) bangun jam \(wakeUpTime)")
//                    //                     Read sleep data
//                    //                                            let wakeUp = DateUtil.calculateNextDateWithSameTime(from: Date(), at: wakeUpTime)
//                    //                                            let bedTime = DateUtil.calculateNextDateWithSameTime(from: Date(), at: bedTimeCommitment)
//                    //                                            print("tidur jam \(bedTime) bangun jam \(wakeUp)")
//                    
////                    sleepManager.readSleep(from: Date().startOfDay, to: Date().endOfDay)
//                    withAnimation(Animation.easeInOut(duration: 2.0)) {
//                        StepBarProgress = todaysStepCount / 4500.0
//                        SleepBarProgress = sleepFilter.getTotalDurationSleep(sleepData: sleepManager.sleepData)
//                        / wakeUpTime.timeIntervalSince(bedTimeCommitment)
//                        print("sleep progres \(SleepBarProgress)")
//                    }
//                }
//            }
//            .background(LinearGradient(gradient: Gradient(colors: [.blueGray, .black]), startPoint: .top, endPoint: .bottom)
//                .edgesIgnoringSafeArea(.all))
//        }
//        .navigationBarHidden(true)
//    }
//}
//
//extension DashboardView {
//    func combineTimeWithToday(time: Date) -> Date? {
//        let calendar = Calendar.current
//        
//        // Get the date components from the current date
//        let todayComponents = calendar.dateComponents([.year, .month, .day], from: Date())
//        
//        // Get the time components from the 'time' date
//        let timeComponents = calendar.dateComponents([.hour, .minute, .second], from: time)
//        
//        // Combine the date components from today with the time components
//        let combinedDate = calendar.date(bySettingHour: timeComponents.hour ?? 0,
//                                         minute: timeComponents.minute ?? 0,
//                                         second: timeComponents.second ?? 0,
//                                         of: calendar.date(from: todayComponents)!)
//        
//        return combinedDate
//    }
//    
//    func calculatePercentageSleep(yourSleep: TimeInterval, sleepTime: TimeInterval) -> Double {
//        if sleepTime <= 0 {
//            return 0.0 // To avoid division by zero
//        }
//        let percentage = (yourSleep / sleepTime) * 100.0
//        return min(100.0, percentage) // Ensure the result is within [0, 100]
//    }
//}
//
//#Preview {
//    DashboardView()
//}
