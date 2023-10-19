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
                        .frame(width: 178, height: 128)
                        .border(.red)
                    Spacer()
                }
                .padding(.top, 5)

                Text("Based on your health data")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                    .padding(.top, 12)
                
                Text("Your average sleep time is:")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .foregroundStyle(.white)
                    .padding(.top, 64)
                
                HStack(alignment: .bottom) {
                    Text("5")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                    Text("hours")
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .foregroundStyle(.white)
                    Text("27")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                    Text("minutes")
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .foregroundStyle(.white)
                }
                .border(.red)
                
                Text("Based on research, young adult should sleep at 7-9 hours each night")
                    .font(.system(size: 17, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white)
                    .padding(.top, 54)
                
                Spacer()
                Spacer()
                RoundedButton(title: "What’s next?",
                              action: {},
                              backgroundColor: .paleLavender,
                              foregroundColor: .black,
                              cornerRadius: 15)
                Spacer()
            }
            .border(.red)
            .padding()
            .padding(.horizontal)
        }
    }
}

#Preview {
    Screen9View()
}
