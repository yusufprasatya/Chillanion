//
//  SleepProblemView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 31/10/23.
//

import SwiftUI

struct SleepProblemView: View {
    @Binding var screen: Int
    var body: some View {
        ZStack {
            // Your existing content for the walkthrough screen
            VStack {
                Spacer()
                HStack{
                    Spacer()
                    Image("welcome_image")
                        .resizable()
                        .frame(maxWidth: 245, maxHeight: 234)
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 40)
                    Spacer()
                }
                Spacer()
                VStack(alignment: .leading, spacing: 30){
                    Text("Irregular Sleep Schedule, Huh?")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .padding(.leading, 10) // Adjust the leading padding
                    
                    Text("Do you know that lack of a regular sleep routine is hurting our health? \n\nBy trying to sleep in the same time every night, it will help us to have a consistent sleep schedule that will lead to a better overall well-being.")
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color.white)
                        .padding(.leading, 10) // Adjust the leading padding
                }
                Spacer()
                RoundedButton(
                    title: "Next",
                    action: {
                        withAnimation{
                            screen += 1
                        }
                    },
                    backgroundColor: .primaryButton,
                    foregroundColor: .white,
                    cornerRadius: 15)
                
            }
        }
        .transition(.move(edge: .leading))
        .overlay(
            // Skip Button
            Button(action: {
                // Handle the action for "Skip"
                withAnimation {
                    screen += 2
                }
            }) {
                Text("Skip")
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .foregroundColor(.lightpurple)
                    .cornerRadius(10)
            }
            , alignment: .topTrailing
        )
        .padding()
        .background(Image("OnboardingImage")
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all))
    }
}

struct SecondSleepProblemView: View{
    @Binding var screen: Int
    var body: some View {
        ZStack {
            // Your existing content for the walkthrough screen
            VStack {
                Spacer()
                HStack{
                    Spacer()
                    Image("KoalaHug1")
                        .resizable()
                        .frame(maxWidth: 245, maxHeight: 234)
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 40)
                    Spacer()
                }
                Spacer()
                VStack(alignment: .leading, spacing: 30){
                    Text("We understand..")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .padding(.leading, 10) // Adjust the leading padding
                    
                    Text("The joy that comes from having someone accompany us on our journey of improvement! \n\n\nSo..")
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color.white)
                        .padding(.leading, 10) // Adjust the leading padding
                }
                Spacer()
                RoundedButton(
                    title: "Next",
                    action: {
                        withAnimation {
                            screen += 1
                        }
                    },
                    backgroundColor: .primaryButton,
                    foregroundColor: .white,
                    cornerRadius: 15)
                
            }
        }
        .transition(.move(edge: .trailing))
        .overlay(
            // Skip Button
            Button(action: {
                // Handle the action for "Skip"
                withAnimation {
                    screen += 1
                }
            }) {
                Text("Skip")
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .foregroundColor(.lightpurple)
                    .cornerRadius(10)
            }
            , alignment: .topTrailing
        )
        .overlay(
            Button(action: {
                withAnimation {
                    screen -= 1
                }
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.lightpurple)
                    Text("Back")
                        .foregroundColor(.lightpurple)
                        .cornerRadius(10)
                }
            }
            , alignment: .topLeading)
        .padding()
        .background(Image("OnboardingImage")
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    SecondSleepProblemView(screen: .constant(1))
}
