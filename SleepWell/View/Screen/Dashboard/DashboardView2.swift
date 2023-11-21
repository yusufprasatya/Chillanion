//
//  Dashboardiew2.swift
//  SleepWell
//
//  Created by Billbert Pohandy on 20/11/23.
//

import SwiftUI

struct DashboardView2: View {
    @State private var SleepBarProgress: Double = 0.0
    @State private var StepBarProgress: Double = 0.0
    
    var body: some View {
        ScrollView {
            VStack{
                
                Text("Hi, Gemi!")
                    .foregroundStyle(Color.white)
                    .fontWeight(.bold)
                    .font(.system(size: 34))
                    .offset(x: -126, y: 20)
                    .fixedSize(horizontal: true, vertical: false)
                    .frame(width: 110, alignment: .leading)
                HStack {
                    VStack {
                        
                        Text("Your Last night’s sleep duration:")
                            .foregroundStyle(Color.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 17))
                            .offset(x: -40)
                        Text("0%")
                            .foregroundStyle(Color.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 32))
                            .offset(x: -84)
                            .padding(.top, -4)
                            .padding(.bottom, 2)
                        Text("Based on your commitment")
                            .foregroundStyle(Color.white)
                            .fontWeight(.medium)
                            .font(.system(size: 13))
                            .offset(x: -24)
                            .lineLimit(1)
                            .frame(width: 224)
                        
                        
                    }
                    
                    ZStack{
                        CircularBarView(progress: $SleepBarProgress)
                        switch SleepBarProgress {
                        case 0.25..<0.50:
                            Image("koalaSoso")
                                .resizable()
                                .frame(width: 93, height: 67)
                            
                        case 0.50..<0.75:
                            Image("koalaGood")
                                .resizable()
                                .frame(width: 93, height: 67)
                            
                        case 0.75...2.0:
                            Image("koalaHappy")
                                .resizable()
                                .frame(width: 93, height: 67)
                            
                        default:
                            Image("KoalaSad")
                                .resizable()
                                .frame(width: 93, height: 67)
                            
                        }
                    }
                }
               
                .padding(.bottom, 4)
                
                
                HStack{
                    Spacer()
                    Text("Your sleep time goal:")
                        .foregroundStyle(Color.white)
                        .fontWeight(.medium)
                        .font(.system(size: 17))
                    Spacer()
                    Text("23.30")
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                        .font(.system(size: 34))
                    Spacer()
                }
                .background(
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 343, height: 55)
                        .background(Color.timegoalbg)
                        .cornerRadius(15))
                
                
                ZStack {
                    Image("chillatips2")
                        .offset(x: -8.5, y: -12)
                    
                    Text("Welcome!\nLater, You can see your sleep report here!")
                        .foregroundStyle(Color.white)
                        .fontWeight(.medium)
                        .font(.system(size: 17))
                        .offset(y: 20)
                        .lineLimit(3)
                        .multilineTextAlignment(.center)
                        .frame(width: 305, height: 73, alignment: .top)
                }
               
                
                Text("Today’s Habit☀️")
                    .foregroundStyle(Color.white)
                    .offset(x: -105)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
             
                    Image("KoalaSad")
                        .resizable()
                        .frame(width: 100, height: 79)
                    
                    
                    Text("Seems like you don’t have any habit\nreminder list. Set your habit reminder in\nthe explore page.")
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.center)
                        .fontWeight(.medium)
                        .font(.system(size: 17))
                        .padding(.top, 1)
                        .padding(.bottom, 12)
                    
                    RoundedButton(
                        title: "Go to Habit Reminder",
                        action: {
                            
                        },
                        backgroundColor: .primaryButton,
                        foregroundColor: .white,
                        cornerRadius: 15
                    ) .fontWeight(.bold)
                        .font(.system(size: 17))
                
            }
                .padding()
        }.background(LinearGradient(gradient: Gradient(colors: [.blueGray, .black]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

#Preview {
    DashboardView2()
}
