//
//  Screen7View.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 17/10/23.
//

import SwiftUI

struct Screen2View: View {
    @Binding var screen: Int
    @Binding var name: String
    
    @State private var next: Bool = false
    @State private var isDisabled = true
    @State private var rotationAngle = 0.0
    @State private var isScreenVisible = false
    var body: some View {
        Spacer()
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            VStack (alignment: .leading) {
                HStack {
                    Spacer()
                    Image("koalaInTheMoon")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 177, height: 169)
                        .padding(.leading, -10)
                        .rotationEffect(.degrees(rotationAngle))
                    Spacer()
                }
                Group {
                    Text("Hi, I’m Chilla!")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 30)
                        .padding(.bottom, 10)
                    Text("I will accompany you to have better sleep")
                        .font(.system(size: 17, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                    Text("habit.")
                        .font(.system(size: 17, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.bottom, 10)
                    Text("What do you want me to call you?")
                        .font(.system(size: 17, weight: .medium, design: .rounded))
                        .foregroundColor(.paleLavender)
                }
                ZStack(alignment: .bottom) {
                        TextField("", text: $name)
                            .textFieldStyle(PlainTextFieldStyle())
                            .font(.system(size: 34, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        Rectangle()
                        .frame(height: 1)
                            .foregroundColor(.gray)
                }
                .padding(.top, 67)
                RoundedButton(
                    title: "Done",
                    action: {
                        next.toggle()
                        
                        withAnimation{
                            screen += 1
                        }
                    },
                    backgroundColor: name.isEmpty ? Color.gray : Color.primaryButton,
                    foregroundColor: .white,
                    cornerRadius: 15)
                .disabled(name.isEmpty)
                .padding(.top, 212)
            }
            .padding()
            .padding(.top, -20)
            .padding(.horizontal)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .transition(.move(edge: .trailing))
        .onAppear{
            withAnimation {
                isScreenVisible.toggle()
            }
        }
    }
}

#Preview {
    Screen2View(screen: .constant(1), name: .constant(""))
}
