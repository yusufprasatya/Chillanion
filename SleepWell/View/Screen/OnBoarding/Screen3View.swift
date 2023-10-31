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
    @State private var isSheetPresented = false
    @ObservedObject var healthManager = HealthManager()
    
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
                    Button(action: {
                        isSheetPresented.toggle()
                    }, label: {
                        Text("Why we need your health data?")
                            .font(.system(size: 17, weight: .light, design: .rounded))
                            .foregroundColor(.white)
                            .underline()
                            .padding(.bottom, 24)
                    })
                    .fullScreenCover(isPresented: $isSheetPresented) {
                        FullScreenSheetView()
                    }

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
                            healthManager.requestHealthAuthorization()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                withAnimation{
                                    screen += 1
                                }
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

struct FullScreenSheetView: View {
    @Environment(\.presentationMode) var presentationMode

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
                }.padding(.bottom, 80)
                
                Group {
                    Text("We can give your more accurate suggestion and recommendations if you are using Apple Watch when you are sleeping. ")
                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                }
                
                Spacer(minLength: 180)
                Group {
                    RoundedButton(title: "Alright!",
                                  action: {
                        presentationMode.wrappedValue.dismiss()
                    },
                                  backgroundColor: .primaryButton,
                                  foregroundColor: .white,
                                  cornerRadius: 15)
                }
                
            }
            .padding()
            .padding(.top, -20)
            .padding(.horizontal)
        }

    }
}

#Preview {
    Screen3View(screen: .constant(1), name: .constant("Yucuf"))
}
