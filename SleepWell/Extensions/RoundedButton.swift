//
//  Button.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 11/10/23.
//

import SwiftUI

struct RoundedButton: View {
    var title: String
    var action: () -> Void
    var backgroundColor: Color
    var foregroundColor: Color
    var cornerRadius: CGFloat
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(width: 342, height: 60)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.clear, lineWidth: 2)
                )
        }
        .cornerRadius(15)
    }
}

#Preview {
    RoundedButton(
        title: "Click Me",
        action: {
            // Handle button tap action here
            print("Button tapped")
        },
        backgroundColor: .softGrey,
        foregroundColor: .black,
        cornerRadius: 10
    )
    .padding()
}
