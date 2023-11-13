//
//  DashboardView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 25/10/23.
//

import Foundation
import SwiftUI

// created by Bilbert Pohandy
struct DashboardView: View {
    @State private var SleepBarProgress: Double = 0.0
    @State private var StepBarProgress: Double = 0.0
    @State private var isCaffeineSelected = false
    @State private var isNapSelected = false
    @State private var isJournalingSelected = false

    @ObservedObject private var userViewModel = UserViewModel()
    @ObservedObject private var stepService = StepService()
    @EnvironmentObject var sleepManager: SleepManager
    var sleepFilter = SleepFilter()

    @State private var todaysStepCount: Double = 0.0
    @State private var percentageOfSleep = 0.0
    @State private var isSleepDurationGood = false
    @State private var bedTimeCommitment = Date()
    @State private var wakeUpTime = Date()
    @State private var name = ""
    @State private var isOverlayVisible = true

    let sleepQualityData: [Double] = [8, 7, 9, 8, 9, 7, 8]

    var body: some View {
        NavigationStack{
            ScrollView {
                ZStack {
                    VStack(alignment: .leading) {
                        HStack {
                            VStack{
                                Text("Hi, \(name)")
                                    .font(.largeTitle)
                                    .foregroundStyle(Color.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 34))
                                    .padding(.top, -15)
                                    .fixedSize(horizontal: true, vertical: false)
                                    .frame(width: 110, alignment: .leading)
                                Text("Your last night’s\nsleep duration:")
                                    .foregroundStyle(Color.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 14))
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                    .padding(.top, 6)
                                let sleepPercentage = calculatePercentageSleep(yourSleep: sleepFilter.getTotalDurationSleep(sleepData: sleepManager.sleepData), sleepTime: wakeUpTime.timeIntervalSince(bedTimeCommitment))
                                Text("\(DateUtil.formatDoubleToString(param: sleepPercentage))%")
                                    .foregroundStyle(Color.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 32))
                                    .multilineTextAlignment(.leading)
                                    .padding(.top, 6)
                                    .frame(width: 110, alignment: .leading)
                                Text("Based on duration")
                                    .foregroundStyle(Color.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 10))
                                    .frame(width: 110, alignment: .leading).lineLimit(1)
                            }
                            Spacer()
                            ZStack{
                                CircularBarView(progress: $SleepBarProgress)
                                    .background(Color.clear)
                                switch SleepBarProgress {
                                case 0.25..<0.50:
                                    Image("koalaSoso")
                                        .resizable()
                                        .frame(width: 133, height: 96)
                                        .padding(.top, 50)
                                        .padding(.leading, 12)
                                case 0.50..<0.75:
                                    Image("koalaGood")
                                        .resizable()
                                        .frame(width: 133, height: 96)
                                        .padding(.top, 50)
                                        .padding(.leading, 12)
                                case 0.75...2.0:
                                    Image("koalaHappy")
                                        .resizable()
                                        .frame(width: 133, height: 96)
                                        .padding(.top, 50)
                                        .padding(.leading, 12)
                                default:
                                    Image("KoalaSad")
                                        .resizable()
                                        .frame(width: 133, height: 96)
                                        .padding(.top, 50)
                                        .padding(.leading, 12)
                                }
                            }.background(Color.clear)
                            //                            .showCase(order: 0, title: "Hello", cornerRadius: 10, style: .continuous)
                            //                            .border(Color.red)
                        }
                        Spacer(minLength: 40)
                        NavigationLink(destination: SleepReminderView( bedTimeCommitment: $bedTimeCommitment, wakeUpTime: $wakeUpTime), label: {
                            ZStack{
                                Image("SleepGoal")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 342, height: 157)
                                Text("\(DateUtil.formatDateToString(param: bedTimeCommitment))")
                                    .foregroundStyle(Color.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 40))
                                    .padding(.leading, -150)
                                    .padding(.top, 16)
                            }
                        })
                        Image("chillatips")
                            .frame(width: 342, height: 168)
                            .padding(.bottom, 18)
                            .offset(y: -10)
                        Text("Day Activity☀️")
                            .font(.system(size: 20))
                            .foregroundStyle(Color.white)
                            .fontWeight(.bold)
                            .padding(.leading, 5)
                            .padding(.top, -10)
                            .id("DayActivity")
                        NavigationLink(destination: TodayStepView(todayStep: $todaysStepCount), label: {
                            ZStack{
                                Image("StepBackground")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 342, height: 157)
                                    .padding(.top, -5)
                                HStack{
                                    Spacer()
                                    Text("\(DateUtil.formatDoubleToString(param: todaysStepCount))")
                                        .font(.system(size: 34))
                                        .fontWeight(.bold)
                                        .foregroundStyle(Color.white)
                                    + Text("/4500 step")
                                        .font(.system(size: 17))
                                        .foregroundStyle(Color.white)
                                    Spacer()
                                    
                                    StepProgressBar(stepprogress: $StepBarProgress, lineWidth: 15)
                                        .frame(width: 100, height: 100)
                                    Spacer()
                                }
                            }
                        })
                        VStack {
                            Button(action: {
                                isCaffeineSelected.toggle()
                            }) {
                                ZStack {
                                    Color.activitybg
                                        .frame(width: 341, height: 93)
                                    
                                    CustomViewButton(icon: "💧", title: "Stay Hydrated", desc: "Stay peppy! Sip on water throughout the day to keep fatigue at bay!😉", isSelected: isCaffeineSelected) {
                                        isCaffeineSelected.toggle()
                                    }
                                }
                                .cornerRadius(10)
                            }
                            
                            Button(action: {
                                isNapSelected.toggle()
                            }) {
                                ZStack {
                                    Color.activitybg
                                        .frame(width: 341, height: 93)
                                    
                                    CustomViewButton(icon: "🌼", title: "Mindful Breathing", desc: "Give yourself a little peace. Take mindful breaths for less stress, better focus, and stay on track!🌻", isSelected: isNapSelected) {
                                        isNapSelected.toggle()
                                    }
                                }
                                .cornerRadius(10)
                            }
                            
                            Button(action: {
                                isJournalingSelected.toggle()
                            }) {
                                ZStack {
                                    Color.activitybg
                                        .frame(width: 341, height: 93)
                                    
                                    CustomViewButton(icon: "📝", title: "Journaling", desc: "Hey, how's your day going? Or do you have anything on your mind? Care to share?🌸", isSelected: isJournalingSelected) {
                                        isJournalingSelected.toggle()
                                    }
                                }
                                .cornerRadius(10)
                            }
                        }
                        
                        //                    ZStack{
                        //                        Image("SleepActivity")
                        //                            .resizable()
                        //                            .scaledToFill()
                        //                           /* .frame(width: UIScreen.main.bounds.width - 10)*/ // Adjust the image width if needed
                        //                        SleepQualityBarChart(data: sleepQualityData, showDayLabels: false)
                        //                            .padding(.top, 20)
                        //                            .padding(.horizontal, 20)
                        //                    }
                        
                        NavigationLink(destination: JournalView(), label: {
                            Image("JournalBackground")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 342, height: 157)
                                .padding(.top, 35)
                        })
                    }
                    .padding(.horizontal, 40)
                    .background(
                        Image("MainBackground")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea(.all)
                    )
                    //                    .overlay(
                    //                                       Color.black.opacity(isOverlayVisible ? 0.8 : 0)
                    //                                           .edgesIgnoringSafeArea(.all)
                    //                                           .onTapGesture {
                    //                                               withAnimation {
                    //                                                   isOverlayVisible.toggle()
                    //                                }
                    //                            }
                    //                    )
                }
                .transition(.move(edge: .trailing))
                .onAppear {
                    userViewModel.getUser()
                    // bind data to reminder scree
                    name = userViewModel.name
                    wakeUpTime = userViewModel.wakeUpTime
                    bedTimeCommitment = userViewModel.bedTimeCommitment
                    
                    stepService.getTodaysSteps { step in
                        todaysStepCount = step
                    }
                    sleepManager.readSleep(from: userViewModel.bedTimeCommitment, to: userViewModel.wakeUpTime)
                    
                    withAnimation(Animation.easeInOut(duration: 2.0)) {
                        StepBarProgress = todaysStepCount / 4500.0
                        SleepBarProgress = sleepFilter.getTotalDurationSleep(sleepData: sleepManager.sleepData)
                        / wakeUpTime.timeIntervalSince(bedTimeCommitment)
                        print("sleep progres \(SleepBarProgress)")
                    }
                }
                .onDisappear{
                    StepBarProgress = 0.0
                    SleepBarProgress = 0.0
                }
            }
//            .overlay(
//                            Color.black.opacity(isOverlayVisible ? 0.8 : 0)
//                                .edgesIgnoringSafeArea(.all)
//                                .onTapGesture {
//                                    withAnimation {
//                                        isOverlayVisible.toggle()
//                                    }
//                                }
//                        )
            .background(LinearGradient(gradient: Gradient(colors: [.blueGray, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all))
        }
//        }.modifier(ShowcaseRoot(showHighlights: true, onFinished: {
//            print("Finish Onboarding")
//        }))
    }
}

extension DashboardView {
    func combineTimeWithToday(time: Date) -> Date? {
        let calendar = Calendar.current
        
        // Get the date components from the current date
        let todayComponents = calendar.dateComponents([.year, .month, .day], from: Date())
        
        // Get the time components from the 'time' date
        let timeComponents = calendar.dateComponents([.hour, .minute, .second], from: time)
        
        // Combine the date components from today with the time components
        let combinedDate = calendar.date(bySettingHour: timeComponents.hour ?? 0,
                                         minute: timeComponents.minute ?? 0,
                                         second: timeComponents.second ?? 0,
                                         of: calendar.date(from: todayComponents)!)
        
        return combinedDate
    }
    
    func calculatePercentageSleep(yourSleep: TimeInterval, sleepTime: TimeInterval) -> Double {
        if sleepTime <= 0 {
            return 0.0 // To avoid division by zero
        }
        
        let percentage = (yourSleep / sleepTime) * 100.0
        return min(100.0, percentage) // Ensure the result is within [0, 100]
    }
}

#Preview {
    DashboardView()
}
