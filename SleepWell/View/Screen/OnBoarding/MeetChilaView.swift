//
//  MeetChilaView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import SwiftUI

struct MeetChilaView: View {
    @Binding var screen: Int
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            VStack (alignment: .leading) {
                Group {
                    Text("Meet Chilla!")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 30)
                        .padding(.bottom, 10)
                    Text("Your sleep companion.")
                        .font(.system(size: 17, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.bottom, 50)
                }
                HStack {
                    Spacer()
                    Image("koalaInTheMoon")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 301, height: 287)
                        .padding(.leading, -10)
                    Spacer()
                }
                RoundedButton(
                    title: "Hi, Chilla!",
                    action: {
                        withAnimation{
                            screen += 1
                        }
                    },
                    backgroundColor: Color.primaryButton,
                    foregroundColor: .white,
                    cornerRadius: 15)
                .padding(.top, 150)
            }
            .padding()
            .padding(.top, -20)
            .padding(.horizontal)
        }
    }
}

#Preview {
    MeetChilaView(screen: .constant(1))
}
