//
//  Screen7View.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 17/10/23.
//

import SwiftUI
import Combine

struct Screen2View: View {
    @Binding var screen: Int
    @Binding var name: String
    
    @State private var next: Bool = false
    @State private var isDisabled = true
    @State private var rotationAngle = 0.0
    @State private var isScreenVisible = true
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
                
                if isScreenVisible {
                    Group{
                        Spacer(minLength: 500)
                    }
                }
                
                Group {
                    Text("Hola, I’m Chilla!")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 30)
                        .padding(.bottom, 10)
                    Text("I will accompany you to have better sleep \nhabit.")
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
                            .onReceive(Just(name)) { _ in limitText(6) }
                        Rectangle()
                        .frame(height: 1)
                            .foregroundColor(.gray)
                }
                .padding(.top, 67)
                Text("*max. 6 character")
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                RoundedButton(
                    title: "Done",
                    action: {
                        next.toggle()
                        
                        withAnimation{
                            screen += 1
                        }
                    },
                    backgroundColor: name.isEmpty || name.count > 6 ? Color.gray : Color.primaryButton,
                    foregroundColor: .white,
                    cornerRadius: 15)
                .disabled(name.isEmpty || name.count > 6)
                .padding(.top, 212)
            }
            .padding(.top, -20)
            .padding(.horizontal, 30)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .onAppear{
            withAnimation {
                isScreenVisible.toggle()
            }
        }
    }
}

extension Screen2View {
    func limitText(_ upper: Int) {
           if name.count > upper {
               name = String(name.prefix(upper))
           }
       }
}

#Preview {
    Screen2View(screen: .constant(1), name: .constant(""))
}
