//
//  RoundedRectanglePink.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 11/11/23.
//

import SwiftUI

struct RoundedRectanglePink: View {
    var fillColor: Color
    var targetedTime: String
    var actualTime: String
    var category: String
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.softPink, lineWidth: 2)
                    .frame(width: 335, height: 54)
                
                HStack {
                    ZStack {
                        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 15, bottomLeading: 15))
                            .fill(fillColor)
                            .frame(width: 100, height: 54)
                        Text(category)
                            .font(.system(size: 17, weight: .medium, design: .rounded))
                    }
                    Spacer()
                    Text(targetedTime)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                    Spacer()
                    Text(actualTime)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                }
                .padding(.trailing, 20)
            }
    }
}

//#Preview {
//    RoundedRectanglePink(fillColor: Color.lightPink, targetedTime: "23.00", wakeUpTime:"06.00")
//}
