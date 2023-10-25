//
//  Screen11View.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 17/10/23.
//

import SwiftUI

struct Screen7notView: View {
    @Binding var screen: Int
    @Binding var wakeTime: Date
    @Binding var bedTime: Date
    @Binding var sleepDuration: TimeInterval
    
    @State private var name: String = ""
    @State private var next: Bool = false
    @State private var selectedDate: Date = Date()
    var body: some View {
        VStack (alignment: .leading) {
            HStack{
                Spacer()
                Image("koalaInTheMoon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 154, height: 146)
                    .border(.red)
                    .padding(.leading, -50)
                    .padding(.top, -10)
                Spacer()
            }
            
            Text("What time do you usually wake up?")
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
                .padding(.top, 28)
                .padding(.leading, 0)
                .border(.red)
            HStack{
                Spacer()
                VStack {
                    DatePicker("Select a Time", selection: $wakeTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                        .frame(width: 200)
                        .background(.clear)
                        .colorScheme(.dark)
                        .cornerRadius(13)
                }
                Spacer()
            }
            .padding(.top, 48)
            .border(.red)
            Spacer()
            RoundedButton(title: "Continue",
                          action: {
                sleepDuration = getTotalDUrationBeetweenTwoTime(startDate: bedTime, endDate: wakeTime)
                screen += 1
            },
                          backgroundColor: .paleLavender,
                          foregroundColor: .black,
                          cornerRadius: 15)
            .border(.red)
        }
        .border(.red)
        .padding()
        .padding(.horizontal)
    }
}

extension Screen7notView {
    func getTotalDUrationBeetweenTwoTime(startDate: Date, endDate: Date) -> TimeInterval{
        return endDate.timeIntervalSince(startDate)
    }
    
    func humanReadableHour (data: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: data)!
    }
    
    func extractNumbers(from input: String) -> (hours: Int, minutes: Int) {
        do {
            let regex = try NSRegularExpression(pattern: "(\\d+)h (\\d+)m", options: [])
            if let match = regex.firstMatch(in: input, options: [], range: NSRange(input.startIndex..., in: input)) {
                let hoursRange = Range(match.range(at: 1), in: input)
                let minutesRange = Range(match.range(at: 2), in: input)
                
                if let hoursRange = hoursRange, let minutesRange = minutesRange {
                    if let hours = Int(input[hoursRange]), let minutes = Int(input[minutesRange]) {
                        return (hours, minutes)
                    }
                }
            }
        } catch {
            print("Error: \(error)")
        }
        
        return (0, 0)
    }
}
