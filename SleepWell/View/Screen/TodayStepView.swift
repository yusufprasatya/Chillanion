//
//  TodayStepView.swift
//  SleepWell
//
//  Created by Billbert Pohandy on 25/10/23.
//

import SwiftUI

struct TodayStepView: View {
    @State private var StepBarProgress: Float = 0.5

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
                    Text("2250")
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
            Image("TodayStepBackground")
                .resizable()
                .scaledToFill()
            )
        .edgesIgnoringSafeArea(.all)
    }
    
}

#Preview {
    TodayStepView()
}

