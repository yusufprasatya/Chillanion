//
//  MySleepView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 31/10/23.
//

import SwiftUI

struct MySleepView: View {
    @EnvironmentObject var weekStore: WeekStore
    @EnvironmentObject var sleepManager: SleepManager
    @State private var selectedTab: Int = 1
    @State private var isDatePickerVisible = false
    @State private var selectedDate = Date()
    @State var dates: [String] = ["2023-07-01", "2023-07-29"]
    @State private var sleepTabRing: Int = 7
    @State private var isFromWeekView: Bool = false
    @State private var dataSleep: [SleepEntry] = []
    @State var items: [Any] = []
    @State private var isShare: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blueGray, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                Text("Tracker")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .fontDesign(.rounded)
                    .foregroundColor(.white)
                    .padding(.bottom, 13)
                HStack {
                    VStack (alignment: .leading){
                        Text("\(weekStore.selectedDate.toString(format: "EEEE"))")
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        Text(weekStore.selectedDate.toString(format: "dd MMM yyyy"))
                            .font(.system(size: 18, weight: .medium, design: .rounded))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Group {
                        //                        Button(action: {
                        //                            //                            isDatePickerVisible.toggle()
                        //                        }) {
                        //                            Image(systemName: "calendar")
                        //                                .font(.title)
                        //                                .accentColor(.white)
                        //                        }
                        //                        .sheet(isPresented: $isDatePickerVisible) {
                        //                            CalendarView(dates, mode: .basicCalendarMode)
                        //                        }
                        //
                        Button(action: {
                            self.items.removeAll()
                            guard let resultImage = ImageRenderer(content: shareView).uiImage else {
                                return
                            }
                            self.items.append(resultImage)
                            isShare.toggle()
                        }) {
                            Image(systemName: "square.and.arrow.up")
                                .font(.title)
                                .accentColor(.white)
                                .padding(.bottom, 5)
                        }
                        
                        .sheet(isPresented: $isShare) {
                            ShareSheetView(items: items).edgesIgnoringSafeArea(.all)
                        }
                    }
                }
                WeeksTabView() { week in
                    WeekView(activeTab: $selectedTab, sleepTabRing: $sleepTabRing, week: week)
                }
                RingSleepTabView(activeTab: $selectedTab, sleepTabRing: $sleepTabRing, dataSleep: $dataSleep)
            }
            .padding(.horizontal)
            .padding(.top)
        }
    }
    @State var screenWidthShare: CGFloat = 2000
    @State var screenHeightShare: CGFloat = 4330.18
    @State var fontSizeTitle: CGFloat = 2000/15
    @State var fontSizeBody: CGFloat = 2000/25
    @State var fontSizeDesc: CGFloat = 2000/26.5
    @State var fontSizeCallout: CGFloat = 2000/45
    @State var padding: CGFloat = 2000/45
    @State var SleepBarProgress = 0.0
    @State private var percentageOfSleep = 0.0
    @State private var sleepEntry: [SleepEntry] = []
    @State private var actualBedTime: Date = Date()
    @State private var actualWakeUp: Date = Date()
    @State private var commitmentWakeUp: Date = Date()
    @State private var commitmentBedTime: Date = Date()
    var sleepFilter = SleepFilter()
    @ObservedObject private var userViewModel = UserViewModel()
    @State private var bedTimeCommitment = Date()
    @State private var wakeUpTime = Date()
    @State private var name = ""
    
    @State var textTitle: String = ""
    @State var textDescription: String = ""
    @State var textSubTitle: String = ""
    
    var shareView: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blueGray, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                let widthScaleFactor = screenWidthShare / 2000
                let heightScaleFactor = screenHeightShare / 4330.18
                
                let imageSize: CGFloat = 68 * widthScaleFactor
                let progressBarSize: CGFloat = 120 * widthScaleFactor
                let paddingValue: CGFloat = 10 * widthScaleFactor
                ZStack {
                    switch SleepBarProgress {
                    case 0.25..<0.50:
                        Image("koalaSoso")
                            .resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .padding(.top, 50)
                            .padding(.leading, 12)
                    case 0.50..<0.75:
                        Image("koalaGood")
                            .resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .padding(.top, 50)
                            .padding(.leading, 12)
                    case 0.75...2.0:
                        Image("koalaHappy")
                            .resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .padding(.top, 50)
                            .padding(.leading, 12)
                    default:
                        Image("KoalaSad")
                            .resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .padding(.top, 50)
                            .padding(.leading, 12)
                    }
                }
                .padding()
                .onAppear{
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
                    
                    let totalSleepDurationInSeconds = sleepFilter.getTotalDurationSleep(sleepData: sleepEntry)
                    
                    // Convert seconds to hours
                    let totalSleepDurationInHours = totalSleepDurationInSeconds / 3600.0
                    print("duration \(totalSleepDurationInHours)")
                    
                    if (SleepBarProgress < 0.50) {
                        textTitle = "Oh no!"
                        textSubTitle = "I've only achieved"
                        textDescription = "of my sleep duration with Chillanion. Let's aim for better sleep tonight!"
                    }else{
                        textTitle = "Yeay!"
                        textSubTitle = "I’ve gain"
                        textDescription = "of sleep duration with Chillanion!"
                    }
                }
                Group {
                    Text(textTitle)
                        .font(.caption)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .foregroundColor(.white)
                        .frame(width: 200)
                    Text(textSubTitle)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                        .foregroundColor(.white)
                        .frame(width: 200)
                        .multilineTextAlignment(.center)
                    Text("\(DateUtil.formatDoubleToString(param: percentageOfSleep))%")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                        .foregroundColor(.white)
                    Text(textDescription)
                        .font(.caption)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .foregroundColor(.white)
                        .frame(width: 200)
                        .multilineTextAlignment(.center)
                }
                .padding(.leading, 0)
            }
            .padding()
            .background(
                Image("bgSTars")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea(.all))
            
        }
    }
}

struct CalendarGridView: View {
    @Binding var currentDate: Date
    
    var body: some View {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: currentDate)
        let year = calendar.component(.year, from: currentDate)
        
        let dateComponents = DateComponents(year: year, month: month, day: 1)
        let firstDayOfMonth = calendar.date(from: dateComponents)!
        let range = calendar.range(of: .day, in: .month, for: firstDayOfMonth)!
        
        return VStack {
            Text("\(calendar.shortMonthSymbols[month - 1]) \(year)")
                .font(.title)
                .padding(.top, 10)
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 10) {
                ForEach(1..<range.count + 1, id: \.self) { day in
                    Text("\(day)")
                        .frame(width: 40, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .onTapGesture {
                            // Handle the selection of a date
                            let newDate = calendar.date(bySetting: .day, value: day, of: currentDate)
                            currentDate = newDate!
                        }
                }
            }
        }
    }
}

struct CalendarPicker: View {
    @Binding var selectedDate: Date
    
    var body: some View {
        DatePicker("", selection: $selectedDate, in: ...Date(), displayedComponents: .date)
            .datePickerStyle(GraphicalDatePickerStyle())
            .labelsHidden()
    }
}


struct CalendarButtonView: View {
    var body: some View {
        Button(action: {
            // Handle the calendar button tap
        }) {
            HStack {
                Image(systemName: "calendar")
                    .font(.title)
            }
        }
    }
}

struct ListItemsView: View {
    var body: some View {
        VStack {
            Text("List Item")
                .font(.title)
                .foregroundColor(.black)
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width, height: 100)
        .background(Color.blue)
    }
}

struct ShareSheetView: UIViewControllerRepresentable {
    let items: [Any]
    func makeUIViewController(context: Context) -> some UIViewController {
        return UIActivityViewController(activityItems: items, applicationActivities: nil)
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

extension Comparable {
    func clamped(to range: ClosedRange<Self>) -> Self {
        return min(max(self, range.lowerBound), range.upperBound)
    }
}


#Preview {
    MySleepView()
}
