//
//  Screen8View.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 17/10/23.
//

import SwiftUI

struct Screen3View: View {
    @Binding var screen: Int
    @Binding var name: String
    @State private var isAlertPresented = false
    @ObservedObject private var sleepManager = SleepManager()
    var body: some View {
        ZStack {
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
                
                Group {
                    Text("Hi, \(name)!")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 30)
                        .padding(.bottom, 5)
                    
                    Text("To know you better, may I ask your permission to access your health data?")
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                }
                
                Spacer(minLength: 180)
                Group {
                    Text("Why we need your health data?")
                        .font(.system(size: 17, weight: .light, design: .rounded))
                        .foregroundColor(.white)
                        .underline()
                        .padding(.bottom, 24)
                    RoundedButton(title: "Sure!",
                                  action: {
                        isAlertPresented.toggle()
                    },
                                  backgroundColor: .primaryButton,
                                  foregroundColor: .white,
                                  cornerRadius: 15)
                }
                
            }
            .padding()
            .padding(.top, -20)
            .padding(.horizontal)
            .alert(isPresented: $isAlertPresented) {
                Alert(
                    title: Text("“Chilla” Would Like to Access Your Health Data"),
                    message: Text("This lets Chilla to personalized your needed information"),
                    primaryButton: .default(
                        Text("Ok"),
                        action: {
                            // Handle access granted here
                            sleepManager.requestHealthAuthorization()
                            withAnimation{
                                screen += 1
                            }
                           
                        }
                    ),
                    secondaryButton: .cancel(
                        Text("Don't Allow"),
                        action: {
                            // Handle access denied here
                        }
                    )
                )
            }
        }
        .transition(.move(edge: .trailing))
    }
}

#Preview {
    Screen3View(screen: .constant(1), name: .constant("Yucuf"))
}
