//
//  TimeView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 22/11/23.
//

import SwiftUI

struct TimeView: View {
    let title: String
    let time: Date
    let commitmentTime: Date
    let timeLate: TimeDifference
    let colorCommitment: Color
    
    var body: some View {
        VStack {
            Text("\(title) \n\(DateUtil.formatDateToString(param: time))")
                .font(.headline)
                .fontDesign(.rounded)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            let hours = timeLate.hours
            let minutes = timeLate.minutes
            
            if hours != 0 {
                Text("\(abs(hours)) hours \(time < commitmentTime ? "early" : "late")")
                    .font(.caption)
                    .fontDesign(.rounded)
                    .fontWeight(.medium)
                    .frame(width: 110, height: 20)
                    .background(time < commitmentTime ? Color.forestGreen : Color.crimsonBlaze)
                    .cornerRadius(15)
                    .foregroundColor(.white)
            } else {
                Text("\(abs(minutes)) minutes \(time < commitmentTime ? "early" : "late")")
                    .font(.caption)
                    .fontDesign(.rounded)
                    .fontWeight(.medium)
                    .frame(width: 110, height: 20)
                    .padding(.horizontal)
                    .background(time < commitmentTime ? Color.forestGreen : Color.crimsonBlaze)
                    .cornerRadius(15)
                    .foregroundColor(.white)
            }
               
        }
    }
}

#Preview {
    TimeView(title: "", time: Date(), commitmentTime: Date(), timeLate: TimeDifference(hours: 2, minutes: 2), colorCommitment: Color.forestGreen)
}
