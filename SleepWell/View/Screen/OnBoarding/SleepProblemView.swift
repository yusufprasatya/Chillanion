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
            // Background Image
            Image("OnboardingImage")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)

            // Your existing content for the walkthrough screen
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image("welcome_image") // Change the image here
                        .resizable()
                        .frame(maxWidth: 245, maxHeight: 234)
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 40)
                    Spacer()
                }
                Spacer()
                VStack(alignment: .leading, spacing: 30) {
                    Text("Irregular Sleep Schedule, Huh?")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .padding(.leading, 10)

                    Text("Do you know that lack of a regular sleep routine is hurting our health? \n\nBy trying to sleep in the same time every night, it will help us to have a consistent sleep schedule that will lead to better overall well-being.")
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color.white)
                        .padding(.leading, 10)
                }
                Spacer()

                // Next Button
                RoundedButton(
                    title: "Next",
                    action: {
                        // Move the background image outside of the withAnimation block
                        screen += 1
                    },
                    backgroundColor: .primaryButton,
                    foregroundColor: .white,
                    cornerRadius: 15
                ).offset(y:-5)
                Spacer()
            }
            .transition(.slide)
            .overlay(
                // Skip Button
                Button(action: {
                    // Handle the action for "Skip"
                    withAnimation {
                        screen += 2
                    }
                }) {
                    Text("Skip")
                        .padding(.horizontal, 23)
                        .padding(.vertical, 54)
                        .foregroundColor(.BarIconColor)
                        .cornerRadius(10)
                }
                , alignment: .topTrailing
            )
            .padding()
        }
    }
}

struct SecondSleepProblemView: View {
    @Binding var screen: Int

    var body: some View {
        ZStack {
            // Background Image
            Image("OnboardingImage")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)

            // Your existing content for the walkthrough screen
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image("KoalaHug1") // Change the image here
                        .resizable()
                        .frame(maxWidth: 245, maxHeight: 234)
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 40)
                    Spacer()
                }
                Spacer()
                VStack(alignment: .leading, spacing: 30) {
                    Text("We understand..")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .padding(.horizontal, 4)
                        .padding(.top, -40)

                    Text("The joy that comes from having someone accompany us on our journey of improvement!")
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color.white)
                        .offset(y: 15)

                    Text("So..")
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color.white)
                        .offset(y: 15)
                    Text("If you can have a friend who can..")
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color.white)
                        .offset(y: 15)
                }

                Spacer()
                // Next Button
                RoundedButton(
                    title: "Next",
                    action: {
                        // Move the background image outside of the withAnimation block
                        screen += 1
                    },
                    backgroundColor: .primaryButton,
                    foregroundColor: .white,
                    cornerRadius: 15
                ).padding(.bottom, -30)
                    .offset(y: -8)
                Spacer()
            }
            .transition(.slide)
            .overlay(
                // Skip Button
                Button(action: {
                    // Handle the action for "Skip"
                    withAnimation {
                        screen += 2
                    }
                }) {
                    Text("Skip")
                        .padding(.horizontal, 23)
                        .padding(.vertical, 54)
                        .foregroundColor(.BarIconColor)
                        .cornerRadius(10)
                }
                , alignment: .topTrailing
            )
            .padding()
        }
    }
}

#Preview {
    SecondSleepProblemView(screen: .constant(1))
}
