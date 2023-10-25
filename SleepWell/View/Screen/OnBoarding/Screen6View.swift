//
//  Screen9View.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 20/10/23.
//

import SwiftUI

struct Screen6View: View {
    @Binding var screen: Int
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            VStack (alignment: .leading) {
                HStack{
                    Spacer()
                    Image("koala")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 185, height: 146)
                    Spacer()
                }
                .padding(.bottom, 12)
                Group {
                    Text("Before we go further....")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                    Text("Have you ever heard about “sleep cycle”?")
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundStyle(.white)
                        .padding(.top, 44)
                    Text("Let’s check this out!")
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundStyle(.white)
                        .padding(.top, 19)
                }
                Spacer()
                Spacer()
                RoundedButton(title: "Let’s go!",
                              action: {
                    withAnimation {
                        screen += 1
                    }
                },
                              backgroundColor: .primaryButton,
                              foregroundColor: .white,
                              cornerRadius: 15)
            }
            .padding()
            .padding(.top, -20)
            .padding(.horizontal)
        }
        .transition(.move(edge: .trailing))
    }
}
#Preview {
    Screen6View(screen: .constant(1))
}
