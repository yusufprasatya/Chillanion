//
//  Screen6View.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 17/10/23.
//

import SwiftUI

struct Screen1View: View {
    @Binding var screen: Int
    @State private var next: Bool = false
    @State private var isAlertPresented = false
    @State private var bedTime: Date = Date()
    @State private var wakeTime: Date = Date()
    @State private var showingAlert = false
    @State private var sleepDuration: TimeInterval = 0
    @ObservedObject private var sleepManager = SleepManager()
    @State private var pageVisible = false
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .transition(.move(edge: .leading))
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
                        withAnimation {
                            screen += 1
                        }
                    },
                    backgroundColor: .primaryButton,
                    foregroundColor: .white,
                    cornerRadius: 15)
                
            }
            .padding()
            .padding(.horizontal)
        }
        .transition(.move(edge: .trailing))
    }
}

#Preview {
    Screen1View(screen: .constant(1))
}
