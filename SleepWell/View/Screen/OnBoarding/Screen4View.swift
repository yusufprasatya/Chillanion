//
//  Screen9View.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 17/10/23.
//

import SwiftUI

struct Screen4View: View {
    @Binding var screen: Int
    @Binding var averageSleepDuration: String
    @State private var name: String = ""
    @State private var next: Bool = false
    @ObservedObject private var sleepManager: SleepManager = SleepManager()
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            VStack (alignment: .center) {
                Spacer()
                HStack{
                    Spacer()
                    ZStack {
                        CircularDotProgressView()
                        Image("koalaInTheMoon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 114)
                            .padding(.leading, -25)
                    }
                    .padding()
                    Spacer()
                }
                Group {
                    Text("Give us a second!")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundStyle(.white)
                    Text("We will give you the calculation of your sleep duration")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                }
                Group {
                    Spacer()
                    Spacer()
                }
            }
            .padding()
            .padding(.horizontal)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    screen += 1
                }
            }
        }
    }
}

extension Screen4View {
    func getTotalDUrationBeetweenTwoTime(startDate: Date, endDate: Date) -> TimeInterval{
        return endDate.timeIntervalSince(startDate)
    }
    
    func humanReadableHour (data: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: data)!
    }
    
    func extractNumbers(from input: String) -> (hours: Int, minutes: Int) {
        do {
            let regex = try NSRegularExpression(pattern: "(\\d+)h (\\d+)m", options: [])
            if let match = regex.firstMatch(in: input, options: [], range: NSRange(input.startIndex..., in: input)) {
                let hoursRange = Range(match.range(at: 1), in: input)
                let minutesRange = Range(match.range(at: 2), in: input)
                
                if let hoursRange = hoursRange, let minutesRange = minutesRange {
                    if let hours = Int(input[hoursRange]), let minutes = Int(input[minutesRange]) {
                        return (hours, minutes)
                    }
                }
            }
        } catch {
            print("Error: \(error)")
        }
        
        return (0, 0)
    }
}

#Preview {
    Screen4View(screen: .constant(1), averageSleepDuration: .constant(""))
}
