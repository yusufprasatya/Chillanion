//
//  StepCircular.swift
//  SleepWell
//
//  Created by Billbert Pohandy on 24/10/23.
//

import SwiftUI

struct StepCircular: View {
    @Binding var stepprogress: Float

    var body: some View {
        VStack {
            ProgressBar(progress: $stepprogress)
               
   
        }
        .padding()
    }
}

struct StepProgressBar: View {
    @Binding var stepprogress: Float
    let lineWidth: CGFloat
    
    var stepgradientColors: [Color] {
        if stepprogress <= 0.4 {
            return [Color.circular3]
        } else {
            return [Color.circular3, Color.circular4]
        }
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: lineWidth)
                .opacity(0.20)
                .foregroundColor(Color.gray)
            
            Circle()
                .trim(from: 0.0, to: min(CGFloat(self.stepprogress), 1.0))
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .fill(LinearGradient(gradient: Gradient(colors: stepgradientColors),
                                     startPoint: UnitPoint(x: 0.9, y: 0.5), endPoint: UnitPoint(x: 0.5, y: 0.0)))
                .rotationEffect(Angle(degrees: -90)) 
        }
    }
}
