//
//  ChartBarScreen.swift
//  SleepWell
//
//  Created by Billbert Pohandy on 17/10/23.
//
import SwiftUI

struct FlatRoundedBar: Shape {
    let cornerRadius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Define the shape of the bar with rounded top corners
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + cornerRadius))
        path.addQuadCurve(to: CGPoint(x: rect.minX + cornerRadius, y: rect.minY), control: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY + cornerRadius), control: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

struct SleepQualityBarChart: View {
    let data: [Double] // Sleep quality data for each day of the week
    let showDayLabels: Bool
    let dayLabels = ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5", "Day 6", "Day 7"]
    let maxSleepQuality: Double
    let cornerRadius: CGFloat = 10
    
    init(data: [Double], showDayLabels: Bool = true) {
        self.data = data
        self.showDayLabels = showDayLabels
        self.maxSleepQuality = data.max() ?? 10 // Assuming 10 is the maximum sleep quality
    }

    var body: some View {
        VStack {
            if showDayLabels {
                HStack {
                    ForEach(dayLabels, id: \.self) { dayLabel in
                        Text(dayLabel)
                            .font(.footnote)
                            .foregroundColor(.blue)
                            .padding(.bottom, 10) // Add padding to align labels with the bars
                    }
                }
            }
            
            HStack(alignment: .bottom, spacing: 20) {
                ForEach(0..<data.count, id: \.self) { index in
                   
                        FlatRoundedBar(cornerRadius: cornerRadius)
                            .fill(Color(red: 11 / 255.0, green: 32 / 255.0, blue: 102 / 255.0)) // Custom color here
                            .frame(width: 26, height: CGFloat(data[index]) / CGFloat(maxSleepQuality) * 100)
                            .padding(.bottom, -65)
                    
                }
            }
        }
        .padding(.bottom) // Add padding to push the bars to the bottom
    }
}
struct SleepQualityBarChart_Previews: PreviewProvider {
    static var previews: some View {
        SleepQualityBarChart(data: [5, 6, 7, 8, 9, 8, 7], showDayLabels: true)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding()
    }
}
