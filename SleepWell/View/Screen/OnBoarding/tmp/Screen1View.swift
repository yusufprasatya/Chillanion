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
    @State private var chillaAppear: CGFloat = -7000
    @State private var textAppear: Bool = false
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .transition(.move(edge: .leading))
            VStack (alignment: .leading) {
                Spacer()
                HStack{
                    Spacer()
                    Image("MeetChilaImg")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 301, height: 287)
                        .padding(.top, chillaAppear)
                    Spacer()
                }
                Group {
                    Text("Hola, I’m Chilla!")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(textAppear ? .white: .black)
                        .padding(.top, 30)
                        .padding(.bottom, 10)
                    Text("I am here for you to accompany you in improving better sleep habit!")
                        .font(.system(size: 17, weight: .medium, design: .rounded))
                        .foregroundColor(textAppear ? .white: .black)
                        .padding(.bottom, 10)
                }
                Spacer(minLength: 180)
                
            }
            .padding()
            .padding(.horizontal)
        }
        .onTapGesture {
            screen += 1
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    chillaAppear = 0
                    textAppear.toggle()
                }
            }
        }
        
    }
}

#Preview {
    Screen1View(screen: .constant(1))
}
