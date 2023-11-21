//
//  CircularBarView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 25/10/23.
//

import SwiftUI

// created by Bilbert Pohandy
struct CircularBarView: View {
    @Binding var progress: Double // 2/9

    var body: some View {
        print("progress \(progress)")
       return VStack {
           ProgressBar(progress: $progress, lineWidth: .constant(15))
               .frame(width: 105, height: 105)
              
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
    @Binding var progress: Double
    @Binding var lineWidth: Double
    
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
                .stroke(lineWidth: lineWidth)
                .opacity(0.20)
                .foregroundColor(Color.gray)
            
            Circle()
                .trim(from: 0.0, to: min(CGFloat(self.progress), 1.0))
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
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
