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
                .font(.subheadline)
                .foregroundColor(foregroundColor)
                .padding()
        }
        .frame(width: 309, height: 60)
        .background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(backgroundColor)
        )
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
