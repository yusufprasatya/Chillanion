//
//  NavigationButton.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 23/10/23.
//

import SwiftUI

struct NavigationButton: View {
    var backgroundColor: Color
    var foregroundColor: Color
    var cornerRadius: CGFloat
    var title: String
    var body: some View {
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
            .cornerRadius(cornerRadius)
    }
}

#Preview {
    NavigationButton(backgroundColor: .primaryButton, foregroundColor: .white, cornerRadius: 15, title: "Understood")
}
