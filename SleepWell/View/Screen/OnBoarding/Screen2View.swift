//
//  Screen7View.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 17/10/23.
//

import SwiftUI

struct Screen7View: View {
    @State private var name: String = "Yusuf"
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            VStack (alignment: .leading) {
                Image("koalaInTheMoon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 177, height: 169)
                    .padding(.leading, 60)
                    .padding(.top)
                
                Text("Hi, \(name)!")
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.top, 30)
                    .padding(.bottom, 5)
                
                Text("To know you better, may I ask your permission to access your health data?")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                
                
                Spacer(minLength: 180)
                
                Text("Why we need your health data?")
                    .font(.system(size: 17, weight: .light, design: .rounded))
                    .foregroundColor(.white)
                    .underline()
                    .padding(.bottom, 24)
                RoundedButton(title: "Continue",
                              action: {},
                              backgroundColor: .paleLavender,
                              foregroundColor: .black,
                              cornerRadius: 15)
                
                Spacer()
                
            }
            .border(.red)
            .padding(.horizontal)
        }
    }
}

#Preview {
    Screen7View()
}
