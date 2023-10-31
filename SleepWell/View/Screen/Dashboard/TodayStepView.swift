//
//  TodaysStepView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 30/10/23.
//

import SwiftUI

struct TodayStepView: View {
    @State private var StepBarProgress: Double = 0.0
    @Binding var todayStep: Double
    var body: some View {
        VStack {
            Text("Today's step")
                .font(.system(size: 34))
                .fontWeight(.bold)
                .frame(width: 334, alignment: .topLeading)
                .foregroundColor(.white)
                .padding(.top, 112)
          
        ZStack {
            StepProgressBar(stepprogress: $StepBarProgress, lineWidth: 25)
                .frame(width: 218, height: 218)
                .padding(.top, 34)
            
                HStack{
                    Text("\(DateUtil.formatDoubleToString(param: todayStep))")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("/")
                        .font(.system(size: 26))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.leading, -7)
                        .padding(.top, 15)
                }
                Text("4500")
                    .font(.system(size: 26))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.leading, 50)
                    .padding(.top, 70)
            }
          Spacer()
        }
        .background(
            Image("ReminderBackground")
                .resizable()
                .scaledToFill()
            )
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 2.0)){
                StepBarProgress = todayStep / 4500
            }
        }
    }
}

#Preview {
    TodayStepView(todayStep: .constant(1))
}
