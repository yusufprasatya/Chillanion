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
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blueGray, .black]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack (alignment: .leading) {
                        Group {
                            Text("Profile")
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
                            .padding(.bottom, 15)
                            
                        }
                        
                        Text("Sleep Statistics ")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        Image("statistic")
                            .padding(.top, 0)
                        
                        Group {
                            Text("Habit Reminder")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                            HStack {
                                NavigationLink(destination: {
                                    HabitReminderView()
                                }, label: {
                                    VStack {
                                        Text("Building habit is not easy, we know. But relax, Chilla will help and accompany your journey!")
                                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                                            .padding(.bottom, 20)
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    }.background(Rectangle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [.pastelLavender, .paleTaupe]), startPoint: .top, endPoint: .bottom))
                                        .frame(width: 342, height: 97)
                                        .cornerRadius(15))
                                    .padding()
                                })
                            }
                        }
                        
                        Group {
                            Text("Daily Journal")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                            HStack {
                                NavigationLink(destination: {
                                    
                                }, label: {
                                    VStack {
                                        Text("Building habit is not easy, we know. But relax, Chilla will help and accompany your journey!")
                                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                                            .padding(.bottom, 20)
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    }.background(Rectangle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [.pastelLavender, .paleTaupe]), startPoint: .top, endPoint: .bottom))
                                        .frame(width: 342, height: 97)
                                        .cornerRadius(15))
                                    .padding()
                                })
                            }
                        }
                        
                        Group {
                            Text("Things to Learn")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                            HStack {
                                Spacer()
                                NavigationLink(destination: {
                                
                                }, label: {
                                    VStack {
                                        Text("Sleep Cycle")
                                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                                            .padding(.bottom, 20)
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    }.background(Rectangle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [.deepLavender, .lightBeige]), startPoint: .top, endPoint: .bottom))
                                        .frame(width: 160, height: 82)
                                        .cornerRadius(15))
                                    .padding()
                                })
                                Spacer(minLength: 30)
                                NavigationLink(destination: {
                                    
                                }, label: {
                                    VStack {
                                        Text("Sleep Quality")
                                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                                            .padding(.bottom, 20)
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    }.background(Rectangle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [.deepLavender, .lightBeige]), startPoint: .top, endPoint: .bottom))
                                        .frame(width: 160, height: 82)
                                        .cornerRadius(15))
                                    .padding()
                                })
                                Spacer()
                            }
                            .padding(.bottom, 20)
                            
                            HStack {
                                NavigationLink(destination: {
                                    
                                }, label: {
                                    VStack {
                                        Text("Circadian Rythm")
                                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                                            .padding(.bottom, 20)
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    }.background(Rectangle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [ .deepLavender, .lightBeige]), startPoint: .top, endPoint: .bottom))
                                        .frame(width: 160, height: 82)
                                        .cornerRadius(15))
                                })
                                Spacer(minLength: 48)
                                NavigationLink(destination: {

                                }, label: {
                                    VStack {
                                        Text("Sleep Hormone")
                                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                                            .padding(.bottom, 20)
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    }.background(Rectangle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [.deepLavender, .lightBeige]), startPoint: .top, endPoint: .bottom))
                                        .frame(width: 160, height: 82)
                                        .cornerRadius(15))
                                    .padding()
                                })
                                Spacer()
                            }
                        }
                    }
                    .padding()
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
