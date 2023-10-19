//
//  Screen6View.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 17/10/23.
//

import SwiftUI

struct Screen1View: View {
    @State private var name: String = "Yusuf"
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            VStack (alignment: .leading) {
                Image("koalaInTheMoon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 177, height: 169)
                    .padding(.leading, 60)
                
                Text("Hi, I’m Chilla!")
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.top, 30)
                    .padding(.bottom, 5)
                
                Text("Your sleep companion!")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                
                Text("What do you want me to call you?")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .foregroundColor(.paleLavender)
                
                
                ZStack(alignment: .bottom) {
                    TextField("", text: $name)
                        .textFieldStyle(PlainTextFieldStyle())
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    Rectangle()
                        .frame(width: .infinity, height: 1)
                        .foregroundColor(.gray)
                }
                .padding(.top, 50)
                
                Spacer(minLength: 180)
                
                RoundedButton(title: "Continue",
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

struct Screen00View: View {
   @State private var name = ""
    var body: some View{
        VStack (alignment: .leading) {
            Image("koalaInTheMoon")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 177, height: 169)
                .padding(.leading, 60)
            
            Text("Hi, I’m Chilla!")
                .font(.system(size: 34, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .padding(.top, 30)
                .padding(.bottom, 5)
            
            Text("Your sleep companion!")
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .foregroundColor(.white)
                .padding(.bottom, 40)
            
            Text("What do you want me to call you?")
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .foregroundColor(.paleLavender)
            
            
            ZStack(alignment: .bottom) {
                TextField("", text: $name)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                Rectangle()
                    .frame(width: .infinity, height: 1)
                    .foregroundColor(.gray)
            }
            .padding(.top, 50)
            
            Spacer(minLength: 180)
            
            RoundedButton(title: "Continue",
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

#Preview {
    Screen1View()
}
