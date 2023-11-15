//
//  WeekUtil.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 07/11/23.
//
import Foundation


enum TimeDirection {
    case future
    case past
    case unknown
}

struct Week {
    let index: Int
    let dates: [Date]
    var referenceDate: Date
}

class WeekStore: ObservableObject {
    @Published var weeks: [Week] = []
    @Published var selectedDate: Date {
        didSet {
            calcWeeks(with: selectedDate)
        }
    }
    @Published var dateNow: Date = Date()
    
    @Published var dayChart: Int
    var maxDate: Date
    
    init(with date: Date = Date()) {
        self.dayChart = Int(date.toString(format: "dd"))!
        
        let calendar = Calendar.current
        var components = calendar.dateComponents(in: TimeZone(identifier: "Asia/Bangkok") ?? .autoupdatingCurrent, from: date)
        components.hour = 0
        components.minute = 0
        components.second = 0
        
        self.selectedDate = calendar.date(from: components)!
        self.maxDate = Calendar.current.date(byAdding: .day, value: 1, to: date) ?? Date()
        calcWeeks(with: selectedDate)
    }
    
    private func calcWeeks(with date: Date) {
        weeks = [
            week(for: Calendar.current.date(byAdding: .day, value: -7, to: date)!, with: -1),
            week(for: date, with: 0),
            week(for: Calendar.current.date(byAdding: .day, value: 7, to: date)!, with: 1)
        ]
    }
    
    private func calcDays(with date: Date) {
        weeks = [
            week(for: Calendar.current.date(byAdding: .day, value: -1, to: date)!, with: -1),
            week(for: date, with: 0),
            week(for: Calendar.current.date(byAdding: .day, value: 1, to: date)!, with: 1)
        ]
    }
    
    private func week(for date: Date, with index: Int) -> Week {
        var result: [Date] = .init()
        
        
        guard let timeZone = TimeZone(identifier: "Asia/Bangkok") else {
            // Handle the case where the time zone is not valid
            return .init(index: index, dates: [], referenceDate: date)
        }

        var calendar = Calendar.current
        calendar.timeZone = timeZone

        guard let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)) else {
            return .init(index: index, dates: [], referenceDate: date)
        }
        
        (0...6).forEach { day in
            if let weekday = Calendar.current.date(byAdding: .day, value: day, to: startOfWeek) {
                result.append(weekday)
            }
        }
        return .init(index: index, dates: result, referenceDate: date)
    }
    
    func selectToday() {
        select(date: Date())
    }
    
    func select(date: Date) {
        let calendar = Calendar.current
        var components = calendar.dateComponents(in: TimeZone(identifier: "Asia/Bangkok")!, from: date)
        components.hour = 0
        components.minute = 0
        components.second = 0
        selectedDate = calendar.date(from: components)!
    }
    
    func update(to direction: TimeDirection) {
        switch direction {
        case .future:
            selectedDate = Calendar.current.date(byAdding: .day, value: 7, to: selectedDate)!
        case .past:
            selectedDate = Calendar.current.date(byAdding: .day, value: -7, to: selectedDate)!
        case .unknown:
            selectedDate = selectedDate
        }
        calcWeeks(with: selectedDate)
    }
    func updatePreviousOrNextDay(to direction: TimeDirection) {
        switch direction {
        case .future:
            selectedDate = Calendar.current.date(byAdding: .day, value: 1, to: selectedDate)!
        case .past:
            selectedDate = Calendar.current.date(byAdding: .day, value: -1, to: selectedDate)!
        case .unknown:
            selectedDate = selectedDate
        }
        print("jalan jugoo kann?")
        calcDays(with: selectedDate)
    }
}
