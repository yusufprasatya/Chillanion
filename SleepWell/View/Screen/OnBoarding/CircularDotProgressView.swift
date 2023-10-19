//
//  CircularDotProgressView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 17/10/23.
//

import SwiftUI

struct CircularDotProgressView: View {
    @State private var progress: Double = 0.0
    @State private var currentColorIndex = 0
    private let dotCount = 17 // Number of dots
    private let dotColors: [Color] = [.semiBlack, .grey1, .grey2, .grey3, .grey4, .grey5, .grey6, .grey7, .grey8, .grey9, .grey10, .grey11, .grey12, .grey13, .white]
    
    var body: some View {
        ZStack {
            ForEach(0..<dotCount) { index in
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(dotColor(index))
                    .offset(dotPosition(index))
                    .animation(
                        Animation.easeInOut(duration: 1)
                            .repeatForever(autoreverses: false)
                            .delay(0.1 * Double(index))
                    )
            }
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 3).repeatForever(autoreverses: false)) {
                self.currentColorIndex = (self.currentColorIndex + 112) % self.dotColors.count
            }
        }
    }
    
    func dotPosition(_ index: Int) -> CGSize {
        let angle = Double(index) * 360 / Double(dotCount)
        let radians = angle * .pi / 180
        let x = 55 * cos(radians)
        let y = 55 * sin(radians)
        return CGSize(width: x, height: y)
    }
    
    func dotColor(_ index: Int) -> Color {
        let colorIndex = (currentColorIndex + index) % dotColors.count
        return dotColors[colorIndex]
    }
    
    func currentColor() -> Color {
        return dotColors[currentColorIndex]
    }
}


#Preview {
    CircularDotProgressView()
}
