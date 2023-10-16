//
//  CircularBarScreen.swift
//  SleepWell
//
//  Created by Billbert Pohandy on 13/10/23.
//

import SwiftUI

struct CircularBarScreen: View {
    @State private var progress: Float = 0.0 // 2/9

    var body: some View {
        VStack {
            ProgressBar(progress: $progress)
                .frame(width: 200, height: 200)
                .padding()

            Button(action: {
                // Increase progress by 0.05 each time the button is tapped
                self.progress = min(self.progress + 0.05, 1.0)
            }) {
                Text("Increase Progress")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct ProgressBar: View {
    @Binding var progress: Float
    
    var gradientColors: [Color] {
        if progress <= 0.4 {
            return [Color.circular1]
        } else {
            return [Color.circular1, Color.circular2]
        }
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 40.0)
                .opacity(0.20)
                .foregroundColor(Color.gray)
            
            Circle()
                .trim(from: 0.0, to: min(CGFloat(self.progress), 1.0))
                .stroke(style: StrokeStyle(lineWidth: 40.0, lineCap: .round, lineJoin: .round))
                .fill(LinearGradient(gradient: Gradient(colors: gradientColors),
                                     startPoint: UnitPoint(x: 0.9, y: 0.5), endPoint: UnitPoint(x: 0.5, y: 0.0)))
                .rotationEffect(Angle(degrees: -90)) // Start from the top (12 o'clock position)
        }
    }
}

struct CircularBarScreen_Previews: PreviewProvider {
    static var previews: some View {
        CircularBarScreen()
    }
}

