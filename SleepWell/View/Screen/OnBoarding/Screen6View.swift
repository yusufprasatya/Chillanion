//
//  Screen6View.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 18/10/23.
//

import SwiftUI

struct Screen6View: View {
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
                    Image("koalaInTheMoon")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 154, height: 146)
                        .border(.red)
                        .padding(.leading, -50)
                        .padding(.top, -10)
                    Spacer()
                }
                
                Text("What is sleep-cycle?")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                    .padding(.top, 45)
                    .padding(.leading, 0)
                    .border(.red)
                
                Text("A sleep cycle is like a fascinating journey your body takes during sleep. It's made up of different phases, such as light sleep, deep sleep, and rapid eye movement (REM) sleep.   Each cycle lasts about 90 minutes and happens multiple times while you snooze at night. This journey is crucial because it helps your body relax, repair, and refresh itself, making sure you wake up feeling good. ")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .foregroundStyle(.white)
                    .padding(.top, 17)
                    .padding(.leading, 0)
                    .border(.red, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                
                Spacer()
                RoundedButton(title: "Understood!",
                              action: {},
                              backgroundColor: .paleLavender,
                              foregroundColor: .black,
                              cornerRadius: 15)
                .border(.red)
            }
            .padding()
            .padding(.horizontal)
        }
    }
}

#Preview {
    Screen6View()
}
