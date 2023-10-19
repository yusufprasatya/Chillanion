//
//  SelectionView.swift
//  SleepWell
//
//  Created by Billbert Pohandy on 18/10/23.
//
import SwiftUI

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

struct SelectionView: View {
    @State private var selectedCycle: Int?
    @State private var isConfirmEnabled: Bool = false
    @State private var isExplanationPresented = false
    @State private var isConfirmationPresented = false
    
    let buttonWidth: CGFloat = 330
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Sleep Time ")
                    .font(.system(size: 28))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                Text("Cool! Now, if you want to wake up at that time, it’ll be better if you can sleep at these times.")
                    .padding(.horizontal, 40)
                    .font(.system(size: 17))
                    .foregroundColor(.white)
                    .padding(.top, 25)
                
                VStack(spacing: 20) {
                    Group {
                        Button(action: {
                            selectedCycle = 4
                            isConfirmEnabled = true
                        }) {
                            HStack {
                                Text("6 hour sleep")
                                Spacer()
                                Text("00.00")
                            }
                        }
                        .padding(.top, 25)
                        .buttonStyle(CustomButtonStyle(selected: selectedCycle == 4, width: buttonWidth))
                        
                        Button(action: {
                            selectedCycle = 5
                            isConfirmEnabled = true
                        }) {
                            HStack {
                                Text("7.5 hour sleep")
                                Spacer()
                                Text("01.30")
                            }
                        }
                        .buttonStyle(CustomButtonStyle(selected: selectedCycle == 5, width: buttonWidth))
                        
                        Button(action: {
                            selectedCycle = 6
                            isConfirmEnabled = true
                        }) {
                            HStack {
                                Text("9 hour sleep")
                                Spacer()
                                Text("03.00")
                            }
                        }
                        .buttonStyle(CustomButtonStyle(selected: selectedCycle == 6, width: buttonWidth))
                    }
                    
                    Button(action: {
                        isExplanationPresented.toggle()
                    }) {
                        HStack {
                            Text("Why this time?")
                                .font(.headline)
                                .underline()
                                .foregroundColor(.buttoncolor)
                        }
                    }
                    .padding(.leading, -160)
                    .sheet(isPresented: $isExplanationPresented) {
                        ExplanationView(explanation: "Explanation for the selected time.")
                    }
                    
                    Button(action: {
                        print("Confirmed selection: \(selectedCycle ?? -1)")
                        isConfirmationPresented.toggle()
                    }) {
                        Text("Confirm")
                    }
                    .buttonStyle(ConfirmButtonStyle(enabled: isConfirmEnabled, width: buttonWidth))
                    .disabled(!isConfirmEnabled)
                    .background(
                        NavigationLink("", destination: ConfirmationView(selection: selectedCycle ?? 0), isActive: $isConfirmationPresented)
                            .opacity(0)
                    )
                }
            }
            .background(
                ZStack {
                    Image("KoalaBackground")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    Color.clear
                }
            )
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("", displayMode: .inline)
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

struct ConfirmationView: View {
    let selection: Int
    
    var body: some View {
        VStack {
            Text("Confirmation")
                .font(.largeTitle)
                .padding()
            
            Text("You have confirmed \(selection) hour sleep.")
                .padding()
        }
    }
}

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView()
    }
}
