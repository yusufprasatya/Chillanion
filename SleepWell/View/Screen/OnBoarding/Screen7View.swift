//
//  Screen10View.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 17/10/23.
//

import SwiftUI

struct Screen7View: View {
    @Binding var screen: Int
    @Binding var name: String
    @Binding var averageSleepDuration:  String
    @State private var selectedDate: Date = Date()
    @State var next: Bool = false
    var body: some View {
        NavigationStack {
            ZStack{
                Image("bg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                VStack (alignment: .leading) {
                    HStack {
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
                        Text("What is sleep-cycle?")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                            .padding(.bottom, 10)
                        
                        Text("A sleep cycle is like a fascinating journey your body takes during sleep. It's made up of different phases, such as light sleep, deep sleep, and rapid eye movement (REM) sleep.")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .foregroundStyle(.white)
                        
                        Text("Each cycle = +- 90 minutes")
                            .font(.system(size: 25, weight: .semibold, design: .rounded))
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                            .padding(.top, 20)
                            .padding(.bottom, 20)
                            .padding(.leading, 10)
                        
                        Text("Each cycle lasts about 90 minutes and happens multiple times while you snooze at night. ")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .foregroundColor(.white)+Text("This journey is crucial because it helps your body relax, repair, and refresh itself, making sure you wake up feeling good.")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .foregroundColor(.white)
                            .underline()
                            
                        Spacer(minLength: 20)
                            
                        Text("Sleep duration that is for recommended fo young adults to wake-up refreshed and energized is between ")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .foregroundColor(.white)+Text("4 cycles to 7 cycles.").underline()
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Spacer()
                    NavigationLink(destination: Screen8View(screen: $screen, name: $name), label: {
                        NavigationButton(backgroundColor: .primaryButton, foregroundColor: .white, cornerRadius: 15, title: "Understood")
                    })
                }
                .padding()
                .padding(.top, -20)
                .padding(.horizontal)
            }
            .onAppear{
                print("\(name) \(averageSleepDuration)")
            }
        }
        .transition(.move(edge: .trailing))
    }
}

#Preview {
    Screen7View(screen: .constant(1), name: .constant(""), averageSleepDuration: .constant(""))
}
