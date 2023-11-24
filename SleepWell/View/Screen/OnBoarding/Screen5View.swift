//
//  Screen8View.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 18/10/23.
//

import SwiftUI

struct Screen5View: View {
    @Binding var screen: Int
    @Binding var averageSleepDuration: String
    @Binding var avgSleep: TimeInterval
    @EnvironmentObject var sleepManager: SleepManager
    var sleepFilter = SleepFilter()
    
    var body: some View {
        print("body redraw")
        
        return ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            VStack (alignment: .leading) {
                HStack{
                    Spacer()
                    Image("koala")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 185, height: 146)
                    Spacer()
                }
                .padding(.bottom, 12)
                Group {
                    Text("Based on your health data")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(Color.white)
                    Text("Your average sleep time is:)")
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundStyle(.white)
                        .padding(.top, 44)
                    HStack(alignment: .bottom) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.darkBlue)
                                .frame(width: 342, height: 72)
                                .cornerRadius(15)
                            HStack {
                                Group {
                                    let (hours, minutes) = sleepFilter.calculateThreeMonthTotalDurationOfSleep(sleepData: sleepManager.sleepData)
                                    Text("\(hours)")
                                        .font(.system(size: 34, weight: .bold, design: .rounded))
                                        .foregroundStyle(.white)
                                    Text("hours")
                                        .font(.system(size: 20, weight: .regular, design: .rounded))
                                        .foregroundStyle(.white)
                                    Text("\(minutes)")
                                        .font(.system(size: 34, weight: .bold, design: .rounded))
                                        .foregroundStyle(.white)
                                    Text("minutes")
                                        .font(.system(size: 20, weight: .regular, design: .rounded))
                                        .foregroundStyle(.white)
                                }
                            }
                            .onAppear {
                            }
                        }
                    }
                    .padding(.top, 24)
                    
                    HStack(alignment: .bottom) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.primaryButton)
                                .opacity(0.5)
                                .frame(width: 342, height: 95)
                                .cornerRadius(15)
                            HStack {
                                Group {
                                    Image("ChillaGuide")
                                        .resizable()
                                        .frame(width: 62, height: 95)
                                    VStack(alignment: .leading){
                                        Text("Chilla’s Insight:")
                                            .font(.system(size: 17, weight: .heavy, design: .rounded))
                                            .foregroundStyle(.white)
                                        Text("Based on research, young adult \nshould sleep for 7-9 hours each night.")
                                            .font(.system(size: 16, weight: .regular, design: .rounded))
                                            .foregroundStyle(.white)
                                    }
                                    .padding(.trailing)
                                }
                            }
                        }
                    }
                    .padding(.top, 20)
                    
                    Group {
                        Spacer()
                        Spacer()
                    }
                    RoundedButton(title: "What’s next?",
                                  action: { withAnimation  {
                        screen += 2
                    } },
                                  backgroundColor: .primaryButton,
                                  foregroundColor: .white,
                                  cornerRadius: 15)
                }
                .padding()
                .padding(.top, -20)
                .padding(.horizontal)
            }
            .onAppear {
                let now =  Date()
                var totalDuration: TimeInterval = 0
                
                // create variabel that represent 3 months ago
                let threeMonthAgo = Date() - 3 * 30 * 24 * 60 * 60
                sleepManager.readSleep(from: threeMonthAgo, to: now)
            }
            .onDisappear{
                sleepManager.sleepData = []
            }
            .transition(.move(edge: .trailing))
        }
    }
}

extension Screen5View {
    func getTotalDUrationBeetweenTwoTime(startDate: Date, endDate: Date) -> TimeInterval{
        return endDate.timeIntervalSince(startDate)
    }
    
    func humanReadableHour (data: TimeInterval) -> String {
        print("humanReadableHour kepanggil")
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: data)!
    }
    
    func extractNumbers(from input: String) -> (hours: Int, minutes: Int) {
        print("extractNumbers kepanggil")
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
    Screen5View(screen: .constant(1), averageSleepDuration: .constant(""), avgSleep: .constant(0))
}
