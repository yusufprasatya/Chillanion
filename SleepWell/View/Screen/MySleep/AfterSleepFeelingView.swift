//
//  AfterSleepView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 13/11/23.
//

import SwiftUI

struct AfterSleepFeelingView: View {
    @EnvironmentObject var weekStore: WeekStore
    @State private var isSelectedGood = false
    @State private var isSelectedHappy = false
    @State private var isSelectedCalm = false
    @State private var isSelectedSad = false
    @State private var isSelectedAnnoyed = false
    @State private var isSelectedTired = false
    @State private var isSelectedAngry = false
    @State private var selectedFeeling: String?

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.cyanTeal, .lightKhaki]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack (spacing: 20){
                HStack {
                    VStack (alignment: .leading){
                        //                        Text("\(weekStore.selectedDate.toString(format: "EEEE"))")
                        //                            .font(.system(size: 22, weight: .bold, design: .rounded))
                        //                            .foregroundColor(.white)
                        Text("Friday")
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        //                        Text(weekStore.selectedDate.toString(format: "dd MMM yyyy"))
                        //                            .font(.system(size: 18, weight: .medium, design: .rounded))
                        //                            .foregroundColor(.white)
                        Text("12 Oct 2023")
                            .font(.system(size: 18, weight: .medium, design: .rounded))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                .padding(.top, 30)
                Text("So Gemi,")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                Text("How are feeling today?")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                Spacer()
                RoundedFeelingView(category: "Refreshed", feelEmoji: "😊", color: Color.lightGreen, action: {
                    selectedFeeling = selectedFeeling == "Refreshed" ? nil : "Refreshed"
                }, isSelected: selectedFeeling == "Refreshed")
                RoundedFeelingView(category: "Happy", feelEmoji: "😆", color: Color.darkOrange, action: {
                    selectedFeeling = selectedFeeling == "Happy" ? nil : "Happy"
                }, isSelected: selectedFeeling == "Happy")
                RoundedFeelingView(category: "Calm", feelEmoji: "😌", color: Color.softYellow, action: {
                    selectedFeeling = selectedFeeling == "Calm" ? nil : "Calm"
                }, isSelected: selectedFeeling == "Calm")
                RoundedFeelingView(category: "Sad", feelEmoji: "😢", color: Color.cyan, action: {
                    selectedFeeling = selectedFeeling == "Sad" ? nil : "Sad"
                }, isSelected: selectedFeeling == "Sad")
                RoundedFeelingView(category: "Annoyed", feelEmoji: "😒", color: Color.purple, action: {
                    selectedFeeling = selectedFeeling == "Annoyed" ? nil : "Annoyed"

                }, isSelected: selectedFeeling == "Annoyed")
                RoundedFeelingView(category: "Tired", feelEmoji: "😔", color: Color.vividPink, action: {
                    selectedFeeling = selectedFeeling == "Tired" ? nil : "Tired"

                }, isSelected: selectedFeeling == "Tired")
                RoundedFeelingView(category: "Angry", feelEmoji: "😠", color: Color.red, action: {
                    selectedFeeling = selectedFeeling == "Angry" ? nil : "Angry"

                }, isSelected: selectedFeeling == "Angry")
                Spacer()
                RoundedButton(title: "Continue", action: {
                    
                }, backgroundColor: Color.primaryButton, foregroundColor: .white, cornerRadius: 20)
            }
            .padding()
        }
    }
}

#Preview {
    AfterSleepFeelingView()
}
