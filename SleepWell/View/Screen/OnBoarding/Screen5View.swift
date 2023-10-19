//
//  Screen5View.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 18/10/23.
//

import SwiftUI

struct Screen5View: View {
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
                
                Text("Before we go further....")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                    .padding(.top, 12)
                
                HStack{
                    Text("Have you ever heard about")
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundStyle(.white)
                    Text("“sleep cycle”?")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                }
                
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
    Screen5View()
}
