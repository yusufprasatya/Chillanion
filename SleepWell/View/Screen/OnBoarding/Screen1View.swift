//
//  Screen6View.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 17/10/23.
//

import SwiftUI

struct Screen6View: View {
    @State private var name: String = "Yusuf"
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            VStack (spacing: 20) {
                Text("Hi, \(name)!")
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                    .padding(.top, 45)
                    .padding(.leading, 0)
                
                Text("Ready to have a better sleep habit?")
                    .foregroundStyle(.white)
                    .padding(.leading, -70)
                Spacer()
                RoundedButton(
                    title: "Yes, let's go!",
                    action: {
                        
                    },
                    backgroundColor: Color.paleLavender,
                    foregroundColor: .black,
                    cornerRadius: 15
                ).padding()
                
            }
            .padding()
        }
    }
}

#Preview {
    Screen6View()
}
