//
//  Screen13View.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 17/10/23.
//

import SwiftUI

struct Screen13View: View {
    @State private var name: String = "Yusuf"
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            VStack (spacing: 20) {
                Text("Meet your sleep companion!")
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                    .padding(.top, 45)
                    .padding(.leading, 0)
                
                Text("This cute Koala will be your friend to help you have a better sleep habit!")
                    .foregroundStyle(.white)
                    .padding()
                Image("koalaInTheMoon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 189, height: 180)
                Text("What do you want to call this cute friend?")
                    .foregroundStyle(.white)
                    .padding()
                ZStack(alignment: .bottom) {
                    TextField("", text: $name)
                        .textFieldStyle(PlainTextFieldStyle())
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .padding(.leading, 20)
                        .foregroundColor(.white)
                    Rectangle()
                        .frame(width: 334, height: 1)
                        .foregroundColor(.gray)
                        .padding(.leading)
                }
                .padding(.top, 50)
                Spacer()
                RoundedButton(title: "Continue",
                              action: {},
                              backgroundColor: .paleLavender,
                              foregroundColor: .black,
                              cornerRadius: 15)
            }
            .padding()
        }
    }
}

#Preview {
    Screen13View()
}
