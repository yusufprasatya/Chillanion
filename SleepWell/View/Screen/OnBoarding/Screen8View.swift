//
//  Screen11View.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 20/10/23.
//

import SwiftUI

struct Screen8View: View {
    @Binding var screen: Int
    @Binding var name: String
    @Binding var averageSleepDuration:  String
    @State private var wakeTime: Date = Date()
    var body: some View {
        NavigationStack {
            ZStack {
                Image("bg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                VStack (alignment: .leading) {
                    HStack{
                        Spacer()
                        Image("koalaInTheMoon")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 177, height: 169)
                            .padding(.leading, -10)
                            .rotationEffect(.degrees(2))
                        Spacer()
                    }
                    .padding(.bottom, 30)
                    Group {
                        Text("What is your targeted  wake-up time?")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                            .padding(.bottom, 10)
                        HStack{
                            Spacer()
                            VStack {
                                DatePicker("Select a Time", selection: $wakeTime, displayedComponents: .hourAndMinute)
                                    .labelsHidden()
                                    .datePickerStyle(WheelDatePickerStyle())
                                    .frame(width: 200)
                                    .background(.clear)
                                    .colorScheme(.dark)
                                    .cornerRadius(13)
                            }
                            Spacer()
                        }
                        .padding(.top, 47)
                    }
                    Spacer()
                    NavigationLink(destination: Screen9View(screen: $screen, name: $name, wakeTime: $wakeTime), label: {
                        NavigationButton(backgroundColor: .primaryButton, foregroundColor: .white, cornerRadius: 15, title: "Continue")
                    })
                }
                .padding()
                .padding(.top, -20)
                .padding(.horizontal)
            }
        }
        .accentColor(.BarIconColor)
    
    }
}

#Preview {
    Screen8View(screen: .constant(1), name: .constant(""), averageSleepDuration: .constant(""))
}
