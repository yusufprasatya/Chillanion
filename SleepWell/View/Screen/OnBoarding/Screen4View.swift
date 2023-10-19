//
//  Screen9View.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 17/10/23.
//

import SwiftUI

struct Screen9View: View {
    @State private var name: String = ""
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            VStack (spacing: 20) {
                Text("Okay, now let Chilla knows you better.")
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                    .padding(.top, 45)
                    .padding(.leading, 0)
                
                Image("koalaInTheMoon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 189, height: 180)
                
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
    Screen9View()
}
