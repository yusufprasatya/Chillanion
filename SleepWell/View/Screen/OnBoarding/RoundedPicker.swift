//
//  RoundedPicker.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 18/10/23.
//

import SwiftUI


struct RoundedPicker: View {
    var title1: String
    var title2: String
    var action: () -> Void
    var backgroundColor: Color
    var foregroundColor: Color
    var cornerRadius: CGFloat
    @Binding var isSelected: Bool
    
    var body: some View {
        Button(action: action) {
            HStack{
                Text(title1)
                    .font(.subheadline)
                    .foregroundColor(foregroundColor)
                    .padding()
                Spacer()
                Text(title2)
                    .font(.subheadline)
                    .foregroundColor(foregroundColor)
                    .padding()
            }
        }
        .frame(width: 332, height: 47)
        .background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(backgroundColor)
        )
       
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color.white, lineWidth: isSelected ? 4 : 0) // Adjust the line width as needed
        )
        .border(Color.softYellow)
    }
}
