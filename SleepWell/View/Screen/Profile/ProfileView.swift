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
                            Text("Profile")
                                .font(.title)
                                .fontWeight(.bold)
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
                        Text("Sleep Statistics ")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        Image("sleepStatistic")
                            .padding(.top, 12)
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
                        Group {
                            Text("Things to Learn")
                                .font(.system(size: 22, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                                .padding(.top, 35)
                            HStack {
                                NavigationLink(destination: {
                                }, label: {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.teal)
                                        .frame(width: 165, height: 82)
                                        .overlay(
                                            HStack {
                                                Text("Sleep Cycle")
                                                    .font(.system(size: 15, weight: .bold, design: .rounded))
                                                    .foregroundColor(.white)
                                                Text("💤")
                                                    .font(.system(size: 56, weight: .bold, design: .rounded))
                                                    .foregroundColor(.white)
                                            }
                                        )
                                    //                                    VStack {
                                    
                                })
                                .disabled(true)
                                NavigationLink(destination: {
                                    
                                }, label: {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.burgundy)
                                        .frame(width: 165, height: 82)
                                        .overlay(
                                            HStack {
                                                Text("Sleep Quality")
                                                    .font(.system(size: 15, weight: .bold, design: .rounded))
                                                    .foregroundColor(.white)
                                                Text("🛌")
                                                    .font(.system(size: 56, weight: .bold, design: .rounded))
                                                    .foregroundColor(.white)
                                            })
                                })
                                .disabled(true)
                            }
                            
                            HStack {
                                NavigationLink(destination: {
                                    
                                }, label: {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.cornFlowerBlue)
                                        .frame(width: 165, height: 82)
                                        .overlay(
                                            HStack {
                                                Text("Circadian Rythm")
                                                    .font(.system(size: 15, weight: .bold, design: .rounded))
                                                    .foregroundColor(.white)
                                                Text("💫")
                                                    .font(.system(size: 56, weight: .bold, design: .rounded))
                                                    .foregroundColor(.white)
                                            })
                                })
                                .disabled(true)
                                NavigationLink(destination: {
                                    
                                }, label: {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.plum)
                                        .frame(width: 165, height: 82)
                                        .overlay(
                                            HStack {
                                                Text("Day Activities")
                                                    .font(.system(size: 15, weight: .bold, design: .rounded))
                                                    .foregroundColor(.white)
                                                Text("🌤️")
                                                    .font(.system(size: 56, weight: .bold, design: .rounded))
                                                    .foregroundColor(.white)
                                            })
                                }).disabled(true)
                            }
                        }
                    }
                    .padding()
                    .padding(.horizontal)
                }
                .background(Image("MainBackground")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all))
            }
        }
    }
}

#Preview {
    ProfileView()
}
