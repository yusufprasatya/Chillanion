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
    
    @GestureState private var gestureOffset: CGFloat = 0
    
    @EnvironmentObject var sleepManager: SleepManager
    @ObservedObject private var userViewModel = UserViewModel()
    var sleepFilter = SleepFilter()
    
    @State private var sleepEntry: [SleepEntry] = []
    
    var body: some View {
        print("kerender berapa kali niich")
        return TabView(selection: $activeTab) {
            ForEach(0..<sleepTabRing, id: \.self) { index in
                ScrollView{
                    VStack {
                        ZStack {
                            switch SleepBarProgress {
                            case 0.25..<0.50:
                                Image("koalaSoso")
                                    .resizable()
                                    .frame(width: 270, height: 215)
                                    .padding(.top, 50)
                                    .padding(.leading, 12)
                            case 0.50..<0.75:
                                Image("koalaGood")
                                    .resizable()
                                    .frame(width: 270, height: 215)
                                    .padding(.top, 50)
                                    .padding(.leading, 12)
                            case 0.75...2.0:
                                Image("koalaHappy")
                                    .resizable()
                                    .frame(width: 270, height: 215)
                                    .padding(.top, 50)
                                    .padding(.leading, 12)
                            default:
                                Image("KoalaSad")
                                    .resizable()
                                    .frame(width: 270, height: 215)
                                    .padding(.top, 50)
                                    .padding(.leading, 12)
                            }
                            Text("\(activeTab)")
                                .font(.system(size: 32, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                            ProgressBar(progress: $SleepBarProgress , lineWidth: .constant(30))
                                .frame(width: 274, height: 274)
                                .padding(.leading, 10)
                                .padding(.top, 50)
                        }
                        .padding()
                        Group {
                            Text("Sleep duration")
                                .font(.system(size: 18, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                            Text("\(DateUtil.formatDoubleToString(param: percentageOfSleep))%")
                                .font(.system(size: 32, weight: .semibold, design: .rounded))
                                .foregroundColor(.white)
                                .padding(.bottom, 46)
                        }
                        HStack {
                            Text("Targetted time")
                                .font(.system(size: 17, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                                .padding(.trailing, 12)
                            Text("Actual time")
                                .font(.system(size: 17, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .offset(x: 135)
                        RoundedRectanglePink(fillColor: Color.lightPink, targetedTime: DateUtil.formatDateToString(param: bedTimeCommitment), actualTime: "00.00", category: "Sleep")
                            .padding(.leading, 15)
                        RoundedRectanglePink(fillColor: Color.softYellow, targetedTime: DateUtil.formatDateToString(param: wakeUpTime), actualTime: "07.30", category: "Wake-up")
                            .padding(.leading, 15)
                        Text("Feelings")
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.top, 28)
                            .offset(x: -140)
                        HStack {
                            RoundedRectangleFeeling(category: "Before Sleep", feelEmoji: "😍")
                                .onTapGesture{
                                    showFullScreenCover.toggle()
                                }
                                .fullScreenCover(isPresented: $showFullScreenCover) {
                                    // Your full-screen cover content
                                    BeforeSleepFeelingView()
                                }
                            RoundedRectangleFeeling(category:"After Wake-up", feelEmoji: "😱")
                                .onTapGesture{
                                    showFullScreenCover.toggle()
                                }
                                .fullScreenCover(isPresented: $showFullScreenCover) {
                                    // Your full-screen cover content
                                    AfterSleepFeelingView()
                                }
                        }
                        Text("Habit Tracker")
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.top, 19)
                            .offset(x: -120)
                        
                        VStack {
                            Spacer(minLength: 18)
                            HStack {
                                HabbitCard(icon: "☀️", title: "sunlight exposure")
                                Spacer()
                                HabbitCard(icon: "💡", title: "short breaks")
                            }
                            .padding(.horizontal)
                            HStack {
                                HabbitCard(icon: "💧", title: "stay hydrated")
                                Spacer()
                                HabbitCard(icon: "😴", title: "power nap")
                            }.padding(.horizontal)
                            Spacer(minLength: 18)
                            
                        }
                        
                    }
                    .padding()
                    .background(
                        Image("bgSTars")
                            .resizable()
                            .scaledToFit()
                            .ignoresSafeArea(.all))
                    .offset(y: -50)
                    .tag(index)
                }
               
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .gesture(
            DragGesture()
                .updating($gestureOffset, body: { (value, state, _) in
                    state = value.translation.width
                })
                .onEnded({ value in
                    let offset = value.translation.width
                    let tabWidth = UIScreen.main.bounds.width
                    let changeInTab = Int(offset / tabWidth)
                    withAnimation {
                        activeTab = (activeTab - changeInTab).clamped(to: 0...(4))
                    }
                })
        )
        .onAppear{
            userViewModel.getUser()
            
            //get wakeUp and bedTime from user db
            wakeUpTime = userViewModel.wakeUpTime
            bedTimeCommitment = userViewModel.bedTimeCommitment
            let calendar = Calendar.current
            let currentDate = Date()
            let thirtyDaysAgo = calendar.date(byAdding: .day, value: -30, to: currentDate)
            sleepManager.readSleep(from: thirtyDaysAgo, to: Date())
        }
        .onChange(of: activeTab) { value in
            if value > previousActiveTab {
                direction = .future
            } else if value < previousActiveTab {
                direction = .past
            }
            previousActiveTab = value
            print(gestureOffset)
            
            //            withAnimation {
            //                weekStore.updatePreviousOrNextDay(to: direction)
            //            }
            
            
            sleepEntry = sleepFilter.filteringSleepStages(sleepData: sleepManager.sleepData, selectedDay: weekStore.selectedDate, sleepStage: "", startOfOpeningHours: weekStore.selectedDate.startOfDay, endOfOpeningHours: weekStore.selectedDate.endOfDay)
            withAnimation(Animation.easeInOut(duration: 2.0)) {
                percentageOfSleep = SleepUtil.calculatePercentageSleep(yourSleep: sleepFilter.getTotalDurationSleep(sleepData: sleepEntry), sleepTime: wakeUpTime.timeIntervalSince(bedTimeCommitment))
                
                SleepBarProgress = sleepFilter.getTotalDurationSleep(sleepData: sleepEntry)
                / wakeUpTime.timeIntervalSince(bedTimeCommitment)
            }
        }
    }
}
//#Preview {
//    RingSleepTabView(activeTab: <#Binding<Int>#>, sleepTabRing: <#Binding<Int>#>, dataSleep: <#Binding<[SleepEntry]>#>)
//}
