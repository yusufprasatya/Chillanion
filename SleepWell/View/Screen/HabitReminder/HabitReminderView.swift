//
//  HabitReminderView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import SwiftUI

struct HabitReminderView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blueGray, .black]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack (alignment: .leading) {
                        Text("Habit Reminder")
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .fontDesign(.rounded)
                            .foregroundColor(.white)
                            .padding(.bottom, 14)
                        
                        Group {
                            Text("Day activity ☀️")
                                .font(.title2)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .fontDesign(.rounded)
                                .foregroundColor(.white)
                                .padding(.bottom, 12)
                            HStack {
                                NavigationLink(destination: StepReminderView(), label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(LinearGradient(gradient: Gradient(colors: [ .turquoise, .navyBlue]), startPoint: .top, endPoint: .bottom), lineWidth: 1)
                                            .frame(width: 110, height: 110)
                                            .background(Color.clear)
                                            
                                        
                                        VStack {
                                            Text("🏃")
                                                .font(.system(size: 40, weight: .semibold))
                                            Text("Step")
                                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                                .foregroundColor(.white)
                                        }
                                    }
                                })
                                
                                NavigationLink(destination: SunlightReminderView(), label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(LinearGradient(gradient: Gradient(colors: [ .turquoise, .navyBlue]), startPoint: .top, endPoint: .bottom), lineWidth: 1)
                                            .frame(width: 110, height: 110)
                                            .background(Color.clear)
                                        VStack {
                                            Text("☀️")
                                                .font(.system(size: 40, weight: .semibold))
                                            Text("Sunlight")
                                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                                .foregroundColor(.white)
                                        }
                                    }
                                })
                                NavigationLink(destination:PowerNapReminderView(), label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(LinearGradient(gradient: Gradient(colors: [ .turquoise, .navyBlue]), startPoint: .top, endPoint: .bottom), lineWidth: 1)
                                            .frame(width: 110, height: 110)
                                            .background(Color.clear)
                                        
                                        VStack {
                                            Text("😴")
                                                .font(.system(size: 40, weight: .semibold))
                                            Text("Power Nap")
                                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                                .foregroundColor(.white)
                                        }
                                    }
                                })
                                
                            }
                            .padding(.bottom, 30)
                        }
                        
                        Group {
                            Text("Stop at the right time 🔐️")
                                .font(.title2)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .fontDesign(.rounded)
                                .foregroundColor(.white)
                                .padding(.bottom, 12)
                            HStack {
                                NavigationLink(destination: CaffeineReminderView(), label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(LinearGradient(gradient: Gradient(colors: [.darkOrange, .lightOrange]), startPoint: .top, endPoint: .bottom))
                                            .frame(width: 110, height: 110)
                                        
                                        VStack {
                                            Text("☕️")
                                                .font(.system(size: 40, weight: .semibold))
                                            Text("Caffeine")
                                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                                .foregroundColor(.white)
                                        }
                                    }
                                })
                                NavigationLink(destination: MealReminderView(), label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(LinearGradient(gradient: Gradient(colors: [.darkOrange, .lightOrange]), startPoint: .top, endPoint: .bottom))
                                            .frame(width: 110, height: 110)
                                        
                                        VStack {
                                            Text("🍜")
                                                .font(.system(size: 40, weight: .semibold))
                                            Text("Meal")
                                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                                .foregroundColor(.white)
                                        }
                                    }
                                })
                                NavigationLink(destination: WorkOutReminderView(), label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(LinearGradient(gradient: Gradient(colors: [.darkOrange, .lightOrange]), startPoint: .top, endPoint: .bottom))
                                            .frame(width: 110, height: 110)
                                        
                                        VStack {
                                            Text("🏋🏻")
                                                .font(.system(size: 40, weight: .semibold))
                                            Text("Workout")
                                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                                .foregroundColor(.white)
                                        }
                                    }
                                })
                            }.padding(.bottom, 30)
                        }
                        Group {
                            Text("Time to wind down 🧘🏻‍♀️")
                                .font(.title2)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .fontDesign(.rounded)
                                .foregroundColor(.white)
                                .padding(.bottom, 12)
                            HStack {
                                NavigationLink(destination: JournalingReminderView(), label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(LinearGradient(gradient: Gradient(colors: [.darkTeal, .darkTeal]), startPoint: .top, endPoint: .bottom))
                                            .frame(width: 110, height: 110)
                                        
                                        VStack {
                                            Text("📝")
                                                .font(.system(size: 40, weight: .semibold))
                                            Text("Journaling")
                                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                                .foregroundColor(.white)
                                        }
                                    }
                                })
                                NavigationLink(destination: DimTheLightReminderView(), label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(LinearGradient(gradient: Gradient(colors: [.darkTeal, .darkTeal]), startPoint: .top, endPoint: .bottom))
                                            .frame(width: 110, height: 110)
                                        
                                        VStack {
                                            Text("🛋️")
                                                .font(.system(size: 40, weight: .semibold))
                                            Text("Dim the light")
                                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(.white)
                                        }
                                    }
                                })
                                NavigationLink(destination: SkincareRoutineView(), label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(LinearGradient(gradient: Gradient(colors: [.darkTeal, .darkTeal]), startPoint: .top, endPoint: .bottom))
                                            .frame(width: 110, height: 110)
                                        
                                        VStack {
                                            Text("😶‍🌫️")
                                                .font(.system(size: 40, weight: .semibold))
                                            Text("Skincare routine")
                                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(.white)
                                        }
                                    }
                                })
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
    HabitReminderView()
}
