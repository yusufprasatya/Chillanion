//
//  Screen13View.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 17/10/23.
//

import SwiftUI

struct ConfirmationView: View {
    @Binding var screen: Int
    @Binding var name: String
    @Binding var wakeTime: Date
    @Binding var selectedCycle: Int
    
    @AppStorage("onBoardingShow")
    var onBoardingShow: Bool = false
    
    var body: some View {
        if screen == 10 {
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
                        Text("Well done!")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.bottom, 28)
                        Text("Start from today, Chilla will accompany you on your sleep journey.")
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                            .padding(.bottom, 28)
                        Text("Take it easy, start small. ")
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                        Text("Chilla got your back!")
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                    }
                    Group {
                        Spacer()
                        Spacer()
                    }
                    RoundedButton(title: "Let’s go!",
                                  action: {
                       let bedTimeCommitment = DateUtil.calculateTimes(from: wakeTime, cycle: selectedCycle)
                       let sleepCycle =  SleepUtil.getSleepCycle(param: selectedCycle)
                        let userModel = UserModel(name: name, sleepCycle: sleepCycle, bedTimeCommitment: bedTimeCommitment, targetWakeUpTime: wakeTime)
                        PersistenceController.shared.saveItem(user: userModel)
                        withAnimation {
                            screen += 1
                        }
                        UserDefaults.standard.onBoardingShow = true
                        print("now \(screen)")
                        UserDefaults.standard.onBoardingShow = onBoardingShow
                    },
                                  backgroundColor: .primaryButton,
                                  foregroundColor: .white,
                                  cornerRadius: 15)

                }
                .padding()
                .padding(.top, -20)
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ConfirmationView(screen: .constant(1), name: .constant(""), wakeTime: .constant(Date()), selectedCycle: .constant(1))
}
