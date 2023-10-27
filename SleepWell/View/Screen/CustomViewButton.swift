//
//  CustomViewButton.swift
//  SleepWell
//
//  Created by Billbert Pohandy on 27/10/23.
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
                    Image(icon)
                        .resizable()
                        .frame(width: 43, height: 43)
                        .foregroundColor(.white)
                        .padding(.leading, 15)

                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.system(size: 20))
                            .frame(height: 22)
                            .foregroundColor(.white)
                            .padding(.leading, 10)

                        Text(desc)
                            .font(.system(size: 12))
                            
                            .frame(height: 51, alignment: .top)
                        
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.graytext)
                            .padding(.leading, 11)
                    }

                    Spacer()

                    Image(systemName: isSelected ? "checkmark.square.fill" : "square.fill")
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
    MainScreenView()
}
