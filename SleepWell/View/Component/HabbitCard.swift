//
//  HabbitCar.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 12/11/23.
//

import SwiftUI

struct HabbitCard: View {
    var icon: String
    var title: String
    var body: some View {
        let icon = Text("\(icon)")
            .font(.system(size: 35, weight: .medium, design: .rounded))
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.rich)
            .frame(width: 167, height: 63)
            .overlay(
                HStack {
                    Text("\(icon)")
                        .font(.system(size: 35, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                    Text(title)
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                }
            )
        
    }
}

#Preview {
    HabbitCard(icon: "☀️", title: "sunlight exposure")
}
