//
//  CustomeViewButton.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 30/10/23.
//

import SwiftUI

struct CustomViewButton: View {
    let icon: String
    let title: String
    let desc: String
    let isSelected: Bool
    let action: () -> Void
    
    @State private var scaleFactor: CGFloat = 1
    
    var body: some View {
        Button(action: {
            withAnimation {
                scaleFactor += 0.05
                if scaleFactor > 1 {
                    scaleFactor = 1 // Reset scale if it exceeds 2.0
                }
                action()
            }
        }) {
            ZStack {
                activitybgColor
                    .frame(width: 341, height: 93)
                    .cornerRadius(15)
                HStack {
                    Text(icon)
                        .font(.system(size: 40, weight: .medium, design: .rounded))
                        .padding(.leading, 15)
                    
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                            .frame(height: 22)
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                        
                        Text(desc)
                            .font(.system(size: 14, weight: .regular, design: .rounded))
                            .frame(height: 51, alignment: .top)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.graytext)
                            .padding(.leading, 11)
                    }
                    Spacer()
                    Image(isSelected ? "checkv2" : "UnCheckmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: isSelected ? 50 : 34, height: isSelected ? 50 : 40)
                        .foregroundColor(.black)
                        .font(.system(size: 35))
                        .padding(.trailing, 15)
                        .scaleEffect(scaleFactor)
                }
            }
        }
        .padding(.bottom, -10)
    }
    
    var activitybgColor: Color {
        return isSelected ? Color.doneactivitybg : Color.activitybg
    }
}

#Preview {
    CustomViewButton(icon: "", title: "", desc: "", isSelected: false, action: {
        
    })
}
