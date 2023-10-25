//
//  TImePicker.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 17/10/23.
//

import SwiftUI

struct TimePicker: View {
    @Binding var selectedTime: Date
    @State private var selectedHour = 0
    @State private var selectedMinute = 0
    @State private var amPmSelection = 0
    @State private var currentDate = Date()
    
    let hours = Array(1...12)
    let minutes = Array(0...59)
    let amPmOptions = ["AM", "PM"]
    
    var body: some View {
        HStack {
            Picker("Hour", selection: $selectedHour) {
                ForEach(0..<hours.count, id: \.self) { index in
                    Text("\(hours[index])")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 50)
            
            Picker("Minute", selection: $selectedMinute) {
                ForEach(0..<minutes.count, id: \.self) { index in
                    Text(String(format: "%02d", minutes[index]))
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 50)
            
            Picker("AM/PM", selection: $amPmSelection) {
                ForEach(0..<amPmOptions.count, id: \.self) { index in
                    Text(amPmOptions[index])
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 60)
        }
        .background(.black)
        .cornerRadius(13)
        .frame(width: 198.5, height: 213.5)
        .onReceive([selectedHour, selectedMinute, amPmSelection].publisher.first()) { _ in
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: selectedTime)
            let minute = calendar.component(.minute, from: selectedTime)
            var newTime = calendar.date(bySettingHour: hour, minute: minute, second: 0, of: selectedTime) ?? selectedTime
            newTime = amPmSelection == 0 ? newTime : calendar.date(byAdding: .hour, value: 12, to: newTime) ?? newTime
            newTime = calendar.date(bySettingHour: hours[selectedHour], minute: minutes[selectedMinute], second: 0, of: newTime) ?? newTime
            selectedTime = newTime
        }
    }
}

#Preview {
    TimePicker(selectedTime: .constant(Date()))
}
