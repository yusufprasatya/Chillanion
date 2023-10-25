//
//  Screen12LoadingView.swift
//  SleepWell
//
//  Created by Bilbert Pohandy on 17/10/23.
//

import SwiftUI

// This view created by Bilbert Pohandy
struct Screen9View: View {
    @Binding var screen: Int
    @Binding var name: String
    @Binding var wakeTime: Date
    @State var selectedCycle: Int = 0
    @State private var isConfirmEnabled: Bool = false
    @State private var isExplanationPresented = false
    @State private var isConfirmationPresented = false
    @State var bedTime: String = ""
    let buttonWidth: CGFloat = 330
    var body: some View {
        ZStack{
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            VStack(alignment: .leading) {
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
                    Text("Now, choose your sleep")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Text("time!")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Text("Cool! Now, if you want to wake up at that time, it’ll be better if you can sleep at these times.")
                        .font(.system(size: 17, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 8)
                }
                VStack(spacing: 10) {
                    Text("selectedt \(selectedCycle ?? 0)")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                    Group {
                        Button(action: {
                            selectedCycle = 4
                            isConfirmEnabled = true
                        }) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("4-cycle sleep")
                                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                                    Text("(4 x 90 mins)")
                                        .font(.system(size: 16, weight: .medium, design: .rounded))
                                }
                                Spacer()
                                Text("\(DateUtil.formatDateToString(param: DateUtil.calculateTimes(from: wakeTime, cycle: 4)))")
                                    .font(.system(size: 17, weight: .bold, design: .rounded))
                            }
                        }
                        .buttonStyle(CustomButtonStyle(selected: selectedCycle == 4, width: buttonWidth))
                        Button(action: {
                            selectedCycle = 5
                            isConfirmEnabled = true
                        }) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("5-cycle sleep")
                                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                                    Text("(5 x 90 mins)")
                                        .font(.system(size: 16, weight: .medium, design: .rounded))
                                }
                                Spacer()
                                
                                Text("\(DateUtil.formatDateToString(param: DateUtil.calculateTimes(from: wakeTime, cycle: 5)))")
                                    .font(.system(size: 17, weight: .bold, design: .rounded))
                            }
                        }
                        .buttonStyle(CustomButtonStyle(selected: selectedCycle == 5, width: buttonWidth))
                        Button(action: {
                            selectedCycle = 6
                            isConfirmEnabled = true
                        }) {
                            HStack {
                                VStack (alignment: .leading) {
                                    Text("6-cycle sleep")
                                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                                    Text("(6 x 90 mins)")
                                        .font(.system(size: 16, weight: .medium, design: .rounded))
                                }
                                Spacer()
                                Text("\(DateUtil.formatDateToString(param: DateUtil.calculateTimes(from: wakeTime, cycle: 6)))")
                                    .font(.system(size: 17, weight: .bold, design: .rounded))
                            }
                        }
                        .buttonStyle(CustomButtonStyle(selected: selectedCycle == 6, width: buttonWidth))
                    }
                    Spacer()
                    Button(action: {
                        isExplanationPresented.toggle()
                    }) {
                        HStack {
                            Text("What is sleep cycle?")
                                .font(.system(size: 15, weight: .bold, design: .rounded))
                                .underline()
                                .foregroundColor(.buttoncolor)
                        }
                    }
                    .padding(.leading, -160)
                    .sheet(isPresented: $isExplanationPresented) {
                        ExplanationView(explanation: "Explanation for the selected time.")
                    }
                    
                    //                    Button(action: {
                    //                        print("Confirmed selection: \(selectedCycle ?? -1)")
                    //                        isConfirmationPresented.toggle()
                    //                    }) {
                    //                        Text("Confirm")
                    //                            .font(.system(.subheadline))
                    //                            .foregroundColor(.black)
                    //                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    //                    }
                    //                    .buttonStyle(ConfirmButtonStyle(enabled: isConfirmEnabled, width: buttonWidth))
                    //                    .background(
                    //                        NavigationLink("", destination: ConfirmationView(selection: selectedCycle ?? 0), isActive: $isConfirmationPresented)
                    //                            .opacity(0)
                    //                    )
                    NavigationLink(destination: ConfirmationView(screen: $screen, name: $name, wakeTime: $wakeTime, selectedCycle: $selectedCycle), label: {
                        NavigationButton(backgroundColor: .primaryButton, foregroundColor: .white, cornerRadius: 15, title: "Confirm")
                    })
                }
                .padding(.top, 20)
            }
            .padding()
            .padding(.top, -20)
            .padding(.horizontal)
        }
    }
    
}

struct ExplanationView: View {
    var explanation: String
    var body: some View {
        VStack {
            Text(explanation)
                .padding()
                .navigationBarTitle("Explanation", displayMode: .inline)
        }
    }
}

struct CustomButtonStyle: ButtonStyle {
    var selected: Bool
    var width: CGFloat
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: width)
            .foregroundColor(selected ? .black : .white)
            .background(selected ? Color.buttoncolor : Color.clear)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.buttoncolor, lineWidth: selected ? 0 : 2)
            )
            .contentShape(Rectangle())
    }
}

struct ConfirmButtonStyle: ButtonStyle {
    var enabled: Bool
    var width: CGFloat
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: width)
            .foregroundColor(.purpleBg)
            .background(enabled ? Color.lightpurple : Color.gray)
            .cornerRadius(16)
            .contentShape(Rectangle())
    }
}

#Preview {
    Screen9View(screen: .constant(1), name: .constant(""), wakeTime: .constant(Date()))
}
