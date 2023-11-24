//
//  NewDashboardView.swift
//  SleepWell
//
//  Created by Bilbert Pohandy on 21/11/23.
//

import SwiftUI

struct NewDashboardView: View {
    @State private var SleepBarProgress: Double = 0.0
    @State private var StepBarProgress: Double = 0.0
    @State private var todaysStepCount: Double = 0.0
    @State private var percentageOfSleep = 0.0
    @State private var isSleepDurationGood = false
    @State private var bedTimeCommitment = Date()
    @State private var wakeUpTime = Date()
    @State private var name = ""
    @State private var habitSelected: String = ""
    @State private var timeBeforeSleep: String = ""
    @State var selectedHabit: [String: Bool] = [:]
    @State private var isConfirmationSheetPresented: Bool = false
    @State private var isSave: Bool = false
    @State private var isHabitDone: Bool =  false
    @State private var sleepEntry: [SleepEntry] = []
    @State private var actualBedTime: Date = Date()
    @State private var actualWakeUp: Date = Date()
    @State private var commitmentWakeUp: Date = Date()
    @State private var commitmentBedTime: Date = Date()
    @State private var sleepReport: String = ""
    @State private var selectedHabbitName: String = ""
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)])
    private var habitsEntries: FetchedResults<DailyHabits>
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\TodaysHabit.date)])
    private var todaysHabit: FetchedResults<TodaysHabit>
    
    @ObservedObject private var userViewModel = UserViewModel()
    @ObservedObject private var stepService = StepService()
    @EnvironmentObject var sleepManager: SleepManager
    var sleepFilter = SleepFilter()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack{
                    Text("Hi, \(name)!")
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                        .font(.system(size: 34))
                        .fontDesign(.rounded)
                        .padding(.leading ,-175)
                        .padding(.bottom, -30)
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Your Last night’s sleep duration:")
                                .foregroundStyle(Color.white)
                                .fontWeight(.semibold)
                                .font(.system(size: 17))
                            //                            let sleepPercentage =
                            //                            SleepUtil.calculatePercentageSleep(yourSleep: sleepFilter.getTotalDurationSleep(sleepData: sleepManager.sleepData), sleepTime: wakeUpTime.timeIntervalSince(bedTimeCommitment))
                            
                            Text("\(DateUtil.formatDoubleToString(param: percentageOfSleep))%")
                                .foregroundStyle(Color.white)
                                .fontWeight(.semibold)
                                .font(.system(size: 32))
                                .padding(.top, 1)
                                .padding(.bottom, 1)
                            
                            Text("Based on your commitment")
                                .foregroundStyle(Color.white)
                                .fontWeight(.medium)
                                .font(.system(size: 13))
                                .lineLimit(1)
                        }
                        ZStack{
                            CircularBarView(progress: $SleepBarProgress)
                            switch SleepBarProgress {
                            case 0.25..<0.50:
                                Image("koalaSoso")
                                    .resizable()
                                    .frame(width: 100, height: 67)
                                    .padding(.top, 60)
                                    .padding(.leading, 10)
                                
                            case 0.50..<0.75:
                                Image("koalaGood")
                                    .resizable()
                                    .frame(width: 100, height: 67)
                                    .padding(.top, 60)
                                    .padding(.leading, 10)
                            case 0.75...2.0:
                                Image("koalaHappy")
                                    .resizable()
                                    .frame(width: 100, height: 67)
                                    .padding(.top, 60)
                                    .padding(.leading, 10)
                            default:
                                Image("KoalaSad")
                                    .resizable()
                                    .frame(width: 100, height: 67)
                                    .padding(.top, 60)
                                    .padding(.leading, 10)
                            }
                        }
                        .padding(.top, -20)
                    }
                    .padding(.bottom, 4)
                    
                    HStack{
                        Spacer()
                        Text("Your sleep time goal:")
                            .foregroundStyle(Color.white)
                            .fontWeight(.medium)
                            .font(.system(size: 17))
                        Spacer()
                        Text("\(DateUtil.formatDateToString(param: bedTimeCommitment))")
                            .foregroundStyle(Color.white)
                            .fontWeight(.bold)
                            .font(.system(size: 34))
                        Spacer()
                    }
                    .background(
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 343, height: 55)
                            .background(Color.timegoalbg)
                            .cornerRadius(15))
                    .padding(.vertical)
                    
                    ZStack {
                        Image("chillatips2")
                            .frame(width: 200)
                            .offset(x: -8.5, y: -12)
                        
                        Text("\(sleepReport)")
                            .foregroundStyle(Color.white)
                            .fontWeight(.medium)
                            .font(.system(size: 17))
                            .offset(y: 20)
                            .multilineTextAlignment(.center)
                            .frame(width: 305, alignment: .top)
                    }
                    
                    VStack{
                        Text("Today’s Habit☀️")
                            .foregroundColor(Color.white)
                            .padding(.leading, -170)
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .padding(.bottom)
                        
                        if habitsEntries.filter({ $0.isRemind == true }).isEmpty {
                            Image("KoalaSad")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 79)
                                .padding(.bottom)
                            
                            Text("Seems like you don’t have any habit\nreminder list. Set your habit reminder in\nthe explore page.")
                                .foregroundStyle(Color.white)
                                .multilineTextAlignment(.center)
                                .fontWeight(.medium)
                                .font(.system(size: 17))
                                .padding(.top, 1)
                                .padding(.bottom, 12)
                            
                            NavigationLink(destination: {
                                HabitReminderView()
                            }, label: {
                                NavigationButton(backgroundColor: .primaryButton, foregroundColor: .white, cornerRadius: 15, title: "Go to Habit Reminder")
                            })
                        } else {
                            ForEach(habitsEntries.filter { $0.isRemind }) { dailyHabit in
                                if dailyHabit.name ?? "" == "Step" {
                                    ZStack{
                                        Image("StepBgNew")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 342, height: 157)
                                            .padding(.top, -5)
                                        HStack{
                                            Text("\(DateUtil.formatDoubleToString(param: todaysStepCount)) step")
                                                .font(.system(size: 34))
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.white)
                                        }
                                        .padding(.leading, -107)
                                        .padding(.top, -15)
                                    }
                                    .padding(.bottom, -10)
                                }
                                
                                CustomViewButton(
                                    icon: dailyHabit.icon ?? "",
                                    title: dailyHabit.name ?? "",
                                    desc: dailyHabit.desc ?? "",
                                    isSelected: isHabitDone || selectedHabit[dailyHabit.name ?? ""] ?? false
                                ) {
                                    selectedHabbitName = dailyHabit.name ?? ""
                                    isConfirmationSheetPresented.toggle()
                                    
                                }
                                .onAppear{
                                    if !todaysHabit.filter({ $0.date!.isInSameDay(as: Date()) && $0.name == dailyHabit.name }).isEmpty{
                                        selectedHabit[dailyHabit.name ?? ""] = true
                                    }
                                }
                                .onChange(of: selectedHabit[dailyHabit.name ?? ""]) { val in
                                    if selectedHabit[selectedHabbitName] == true{
                                        if todaysHabit.filter({ $0.date!.isInSameDay(as: Date()) && $0.name == dailyHabit.name }).isEmpty{
                                            print("Save Data \(Date()), \(dailyHabit.name), \(dailyHabit.icon), \(dailyHabit.desc)")
                                            
                                            let todaysHabit = TodayHabit(name: dailyHabit.name!, icon: dailyHabit.icon!, desc: dailyHabit.desc!, isDone: true, date: Date())
                                            
                                            PersistenceController.shared.saveTodaysHabit(todaysHabit: todaysHabit)
                                        }
                                    }
                                }
                                .disabled(selectedHabit[dailyHabit.name ?? ""] ?? false)
                                .alert(isPresented: $isConfirmationSheetPresented) {
                                    // Confirmation alert content
                                    Alert(
                                        title: Text("Confirm Action"),
                                        message: Text("Are you sure you have \(selectedHabbitName)?"),
                                        primaryButton: .cancel(Text("Oops, I missclicked it")),
                                        secondaryButton: .default(Text("Yes, I’ve done it!")) {
                                            // Perform the save action
                                            selectedHabit[selectedHabbitName] = true
                                        }
                                    )
                                }
                            }
                        }
                    }
                }
                .padding()
                .onAppear{
                    print("mashoook1221")
                    userViewModel.getUser()
                    
                    // Update UI-related data on the main queue
                    name = userViewModel.name
                    wakeUpTime = userViewModel.wakeUpTime
                    bedTimeCommitment = userViewModel.bedTimeCommitment
                    
                    let calendar = Calendar.current
                    let actualBedTimeTmp = DateUtil.combineDateWithSelectedTime(specificDate: bedTimeCommitment, selectedDate: Date()) ?? Date()
                    
                    commitmentWakeUp = DateUtil.combineDateWithSelectedTime(specificDate: wakeUpTime, selectedDate: Date()) ?? Date()
                    commitmentBedTime = calendar.date(byAdding: .day, value: -1, to: actualBedTimeTmp) ?? Date()
                    
                    sleepEntry = sleepFilter.filteringSleepDaily(sleepData: sleepManager.sleepData, selectedDay: Date(), startOfOpeningHours: commitmentBedTime, endOfOpeningHours: commitmentWakeUp.addingTimeInterval(10 * 60 * 60))
                    
                    if !sleepEntry.isEmpty {
                        actualBedTime = sleepEntry.first!.startDate
                        actualWakeUp = sleepEntry.last!.endDate
                    }
                    
                    withAnimation{
                        percentageOfSleep = SleepUtil.calculatePercentageSleep(yourSleep: sleepFilter.getTotalDurationSleep(sleepData: sleepEntry), sleepTime: wakeUpTime.timeIntervalSince(bedTimeCommitment))
                        
                        SleepBarProgress = sleepFilter.getTotalDurationSleep(sleepData: sleepEntry)
                        / wakeUpTime.timeIntervalSince(bedTimeCommitment)
                    }
                    
                    StepBarProgress = todaysStepCount / 4500.0
                    
                    let totalSleepDurationInSeconds = sleepFilter.getTotalDurationSleep(sleepData: sleepEntry)
                    
                    // Convert seconds to hours
                    let totalSleepDurationInHours = totalSleepDurationInSeconds / 3600.0
                    print("duration \(totalSleepDurationInHours)")
                    
                    if totalSleepDurationInHours < 3.0 {
                        sleepReport = "\(name), your sleep less than 3 hours last night. But it’s okay, try to sleep and wake-up in schedule for tonight!"
                    }else if totalSleepDurationInHours >= 3.0  && totalSleepDurationInHours < 6.0 {
                        sleepReport = "\(name), your sleep less than 6 hours last night. You still can manage to have a fresh day by doing the recommended activity."
                    }else if totalSleepDurationInHours >= 6.0 && totalSleepDurationInHours <= 9.0 {
                        sleepReport = "Wonderful, \(name) You sleep in schedule with great duration last night. Have a great day!"
                    }
                    
                    // Fetch today's steps asynchronously
                    stepService.getTodaysSteps { step in
                        // Update UI-related data on the main queue
                        DispatchQueue.main.async {
                            todaysStepCount = step
                        }
                    }
                }
            }.background(
                LinearGradient(gradient: Gradient(colors: [.blueGray, .black]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all))
        }
    }
}

struct ConfirmationSheetView: View {
    var confirmAction: () -> Void
    
    var body: some View {
        VStack {
            Text("Are you sure you want to save?")
                .font(.headline)
                .padding()
            
            HStack {
                Button("Cancel") {
                    // Dismiss the sheet without saving
                    // You can add more complex logic here if needed
                }
                .padding()
                
                Button("Save") {
                    // Perform the save action
                    confirmAction()
                    
                    // Dismiss the sheet
                    // You can add more complex logic here if needed
                }
                .foregroundColor(.blue)
                .padding()
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .padding()
    }
}


#Preview {
    NewDashboardView()
}
