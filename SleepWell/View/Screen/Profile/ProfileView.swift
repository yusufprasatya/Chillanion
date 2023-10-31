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
                                        VStack(alignment: .leading){
                                            Text("Try to get a better life?")
                                                .font(.system(size: 15, weight: .bold, design: .rounded))
                                                .foregroundColor(.white)
                                            Text("See what we can improve together")
                                                .font(.system(size: 15, weight: .bold, design: .rounded))
                                                .foregroundColor(.white)
                                        }
                                        .padding(.leading, -65)
                                        
                                        Image("Koala 1")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 147, height: 105)
                                            .position(x: 300, y: 50)
                                            .padding(.top, -20)
                                    }
                                    //                                    VStack {
                                    //                                        Text("Building habit is not easy, we know. But relax, Chilla will help and accompany your journey!")
                                    //                                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                                    //                                            .padding(.bottom, 20)
                                    //                                            .foregroundColor(.black)
                                    //                                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    //                                    }.background(Rectangle()
                                    //                                        .fill(LinearGradient(gradient: Gradient(colors: [.pastelLavender, .paleTaupe]), startPoint: .top, endPoint: .bottom))
                                    //                                        .frame(width: 342, height: 97)
                                    //                                        .cornerRadius(15))
                                    //                                    .padding()
                                })
                            }
                        }
                        //                        Group {
                        //                            Text("Daily Journal")
                        //                                .font(.system(size: 20, weight: .bold, design: .rounded))
                        //                                .foregroundColor(.white)
                        //                            HStack {
                        //                                NavigationLink(destination: {
                        //                                }, label: {
                        //                                    VStack {
                        //                                        Text("Building habit is not easy, we know. But relax, Chilla will help and accompany your journey!")
                        //                                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                        //                                            .padding(.bottom, 20)
                        //                                            .foregroundColor(.black)
                        //                                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        //                                    }.background(Rectangle()
                        //                                        .fill(LinearGradient(gradient: Gradient(colors: [.pastelLavender, .paleTaupe]), startPoint: .top, endPoint: .bottom))
                        //                                        .frame(width: 342, height: 97)
                        //                                        .cornerRadius(15))
                        //                                    .padding()
                        //                                })
                        //                            }
                        //                        }
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
                                })
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
