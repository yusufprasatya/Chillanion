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
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Color(activitybgColor)
                    .frame(width: 341, height: 93)
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
                    Image(isSelected ? "check" : "UnCheckmark")
                        .resizable()
                        .frame(width: 34, height: 34)
                        .foregroundColor(.black)
                        .font(.system(size: 35))
                        .padding(.trailing, 15)
                }
            }
            .cornerRadius(10)
        }
    }
    
    var activitybgColor: Color {
        return isSelected ? Color.doneactivitybg : Color.activitybg
    }
}

#Preview {
    CustomViewButton(icon: "", title: "", desc: "", isSelected: false, action: {
        
    })
}
