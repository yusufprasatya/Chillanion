//
//  RoundedRectangleFeeling.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 11/11/23.
//

import SwiftUI

struct RoundedRectangleFeeling: View {
    var category: String
    var feelEmoji: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.lightTurqoise)
            
            HStack {
                Text(category)
                    .font(.system(size: 17, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                Spacer()
                Text(feelEmoji)
                    .font(.system(size: 40, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
        }
        .frame(width: 167, height: 63)
    }
}

#Preview {
    RoundedRectangleFeeling(category: "Before Sleep", feelEmoji: "😁")
}
