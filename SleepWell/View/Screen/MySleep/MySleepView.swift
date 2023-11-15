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
            VStack{
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
                        Button(action: {
                            isDatePickerVisible.toggle()
                        }) {
                            Image(systemName: "calendar")
                                .font(.title)
                                .accentColor(.white)
                        }
                        .sheet(isPresented: $isDatePickerVisible) {
                            CalendarView(dates, mode: .basicCalendarMode)
                        }
                        
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
            .padding()
        }
        //        .onAppear {
        //            let calendar = Calendar.current
        //            let currentDate = Date()
        //
        //            if let thirtyDaysAgo = calendar.date(byAdding: .day, value: -30, to: currentDate) {
        //                let timeInterval = thirtyDaysAgo.timeIntervalSince1970
        //                sleepManager.readSleep(from: thirtyDaysAgo, to: Date())
        //
        //            } else {
        //                print("Error calculating date")
        //            }
        //
        //        }
    }
    @State var screenWidthShare: CGFloat = 2000
    @State var screenHeightShare: CGFloat = 4330.18
    @State var fontSizeTitle: CGFloat = 2000/15
    @State var fontSizeBody: CGFloat = 2000/25
    @State var fontSizeDesc: CGFloat = 2000/26.5
    @State var fontSizeCallout: CGFloat = 2000/45
    @State var padding: CGFloat = 2000/45
    @State var SleepBarProgress = 100.0
    var shareView: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blueGray, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
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
                ProgressBar(progress: .constant(100.0) , lineWidth: .constant(30))
                    .frame(width: 274, height: 274)
                    .padding(.leading, 10)
                    .padding(.top, 50)
            }
            .padding()
            Group {
                Text("Sleep duration")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                Text("\(DateUtil.formatDoubleToString(param: 100.0))%")
                    .font(.system(size: 32, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.bottom, 46)
            }
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
