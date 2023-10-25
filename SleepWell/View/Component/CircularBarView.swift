//
//  CircularBarView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 25/10/23.
//

import SwiftUI

// created by Bilbert Pohandy
struct CircularBarView: View {
    @Binding var progress: Float // 2/9

    var body: some View {
        VStack {
            ProgressBar(progress: $progress)
                .frame(width: 167, height: 167)
                .padding(.leading, 10)
                .padding(.top, 50)

//            Button(action: {
//                // Increase progress by 0.05 each time the button is tapped
//                self.progress = min(self.progress + 0.05, 1.0)
//            }) {
//                Text("Increase Progress")
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
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
                .stroke(lineWidth: 15)
                .opacity(0.20)
                .foregroundColor(Color.gray)
            
            Circle()
                .trim(from: 0.0, to: min(CGFloat(self.progress), 1.0))
                .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                .fill(LinearGradient(gradient: Gradient(colors: gradientColors),
                                     startPoint: UnitPoint(x: 0.9, y: 0.5), endPoint: UnitPoint(x: 0.5, y: 0.0)))
                .rotationEffect(Angle(degrees: -90)) // Start from the top (12 o'clock position)
        }
    }
}
//

#Preview {
    CircularBarView(progress: .constant(10))
}
