//
//  Screen5View.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 18/10/23.
//

import SwiftUI

struct Screen5notView: View {
    @Binding var screen: Int
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            VStack (alignment: .center) {
                Spacer()
                HStack{
                    Spacer()
                    Image("koala")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 259, height: 205)
                    Spacer()
                }
                .padding(.bottom, 26)
                Group {
                    Text("For now, we have no data. ")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundStyle(.white)
                    Text("But don’t worry, we can add it now🥰")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundStyle(.white)
                }
                Spacer()
                Spacer()
                RoundedButton(title: "OK!",
                              action: {
                    screen += 1
                },
                              backgroundColor: .primaryButton,
                              foregroundColor: .black,
                              cornerRadius: 15)
            }
            .padding()
            .padding(.horizontal)
        }
    }
}

#Preview {
    Screen5notView(screen: .constant(1))
}
