//
//  RoundedFeelingView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 13/11/23.
//

import SwiftUI

struct RoundedFeelingView: View {
    var category: String
    var feelEmoji: String
    var color: Color
    var action: () -> Void
    var isSelected: Bool
    
    var body: some View {
        Button(action: {
                    action() // Perform action on button tap
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(color)
                            .background(isSelected ? Color.navyBlue : Color.clear)
                        
                        HStack {
                            Spacer()
                            Text(feelEmoji)
                                .font(.system(size: 35, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                            Spacer(minLength: 10)
                            Text(category)
                                .font(.system(size: 17, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                            Spacer()
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
                .frame(width: 320, height: 48)
                .buttonStyle(ButtonSelected(selected: isSelected, width: 320))
    }
}

#Preview {
    RoundedFeelingView(category: "Good", feelEmoji: "😃", color: Color.activitybg, action: {}, isSelected: true)
}
