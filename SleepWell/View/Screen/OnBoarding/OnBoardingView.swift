//
//  OnBoardingView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 16/10/23.
//

import SwiftUI

struct OnBoardingView: View {
    @State private var name: String = ""
    @State private var screen: Int = 1
    @State private var next: Bool = false
    @State private var isAlertPresented = false
    
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            if screen == 1{
                VStack (alignment: .leading) {
                    Text("Meet Chiila!")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                        .padding(.top, 28)
                        .padding(.bottom, 16)
                    
                    Text("Your sleep companion.")
                        .foregroundStyle(.white)
                    
                    Spacer()
                    HStack{
                        Spacer()
                        Image("koalaInTheMoon")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 301, height: 287)
                            .padding(.leading, -70)
                        Spacer()
                    }
                    Spacer(minLength: 180)
                    RoundedButton(
                        title: "Hi, Chilla!",
                        action: {
                            next.toggle()
                            screen += 1
                        },
                        backgroundColor: .paleLavender,
                        foregroundColor: .black,
                        cornerRadius: 15)
                }
                .border(.red)
                .padding()
                .padding(.horizontal)
            }
            
            
            if next == true && screen == 2{
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
                    RoundedButton(
                        title: "Done",
                        action: {
                            next.toggle()
                            screen += 1
                        },
                        backgroundColor: .paleLavender,
                        foregroundColor: .black,
                        cornerRadius: 15)
                }
                .border(.red)
                .padding()
                .padding(.horizontal)
            }
            
            if screen == 3 {
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
                    
                    Spacer()
                    
                    Spacer(minLength: 180)
                    Text("Why we need your health data?")
                        .font(.system(size: 17, weight: .light, design: .rounded))
                        .foregroundColor(.white)
                        .underline()
                        .padding(.bottom, 24)
                    RoundedButton(title: "Sure!",
                                  action: {
                        isAlertPresented.toggle()
                    },
                                  backgroundColor: .paleLavender,
                                  foregroundColor: .black,
                                  cornerRadius: 15)
                    
                }
                .border(.red)
                .padding()
                .padding(.horizontal)
                .alert(isPresented: $isAlertPresented) {
                    Alert(
                        title: Text("“Chilla” Would Like to Access Your Health Data"),
                        message: Text("This lets Chilla to personalized your needed information"),
                        primaryButton: .default(
                            Text("Ok"),
                            action: {
                                // Handle access granted here
                            }
                        ),
                        secondaryButton: .cancel(
                            Text("Don't Allow"),
                            action: {
                                // Handle access denied here
                            }
                        )
                    )
                }
            }
            
            if screen == 4{
                Text("Screen 4")
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct Screen2View: View {
    @State private var name: String = ""
    @State private var next: Bool =  false
    @Binding var screen: Int
    
    var body: some View {
        if screen == 2 {
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
                RoundedButton(
                    title: "Done",
                    action: {
                        next.toggle()
                        screen += 1
                        getscreen()
                    },
                    backgroundColor: .paleLavender,
                    foregroundColor: .black,
                    cornerRadius: 15)
            }
            .border(.red)
            .padding()
            .padding(.horizontal)
        }
        
        
    }
    
    func getscreen() {
        print(screen)
    }
}

struct Screen3View: View {
    @Binding var name: String
    @Binding var screen: Int
    
    var body: some View {
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

struct Screen0View: View {
    @State private var name: String = ""
    @State private var screen: Int = 1
    
    var body: some View {
        VStack (spacing: 20) {
            Text("Welcome to Sleepzy!")
                .font(.system(size: 34, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
                .padding(.top, 45)
            
            Text("What do your friends call you?")
                .foregroundStyle(.white)
                .padding(.leading, -70)
            
            
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
            RoundedButton(
                title: "Continue",
                action: {
                    screen = screen + 1
                    print(screen)
                },
                backgroundColor: Color.paleLavender,
                foregroundColor: .black,
                cornerRadius: 15
            ).padding()
            
        }
        .padding()
    }
}

#Preview{
    OnBoardingView()
}
