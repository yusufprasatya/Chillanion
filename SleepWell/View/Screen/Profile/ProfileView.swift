//
//  ProfileView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 23/10/23.
//

import SwiftUI
import Foundation

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack (alignment: .leading) {
                        Group {
                            Text("Explore")
                                .font(.title)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                                .foregroundColor(.white)
                            HStack {
                                Spacer()
                                Image("koalaBlur")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 185, height: 175)
                                Spacer()
                            }
                        }
                
                        Group {
                            Text("Habit Reminder")
                                .font(.system(size: 22, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                                .padding(.top, 27)
                            HStack {
                                NavigationLink(destination: {
                                    HabitReminderView()
                                }, label: {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.imperialBlue)
                                            .frame(width: 342, height: 97)
                                        HStack{
                                            Text("Try to get a better life? Click here to see what we can improve together!")
                                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                                                .foregroundColor(.white)
                                                .multilineTextAlignment(.leading)
                                                .padding(.leading)
                                            Image("Koala 1")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 111, height: 79)
                                        }
                                    }
                                })
                            }
                        }
                    }
                    .background(
                        Image("bgStar")
                            .resizable()
                            .scaledToFill()
                            .offset(y: -150)
                    )
                    .padding()
                    .padding(.horizontal)
                }
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.blueGray, .black]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all))
        }
    }
}

#Preview {
    ProfileView()
}
