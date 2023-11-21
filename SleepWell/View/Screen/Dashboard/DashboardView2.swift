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
            VStack {
               
                    Text("Dashboard")
                        .foregroundStyle(Color.black)
                        .fontWeight(.bold)
                        .font(.system(size: 34))
                
                HStack {
                    VStack {
                        Text("Hi, Gemi!")
                            .foregroundStyle(Color.black)
                            .fontWeight(.semibold)
                            .font(.system(size: 28))
                            .offset(x: -48)
                            
                        
                        Text("Your sleep time goal:")
                            .foregroundStyle(Color.black)
                            .font(.system(size: 17))
                            .offset(x: -25)
                        Text("23.30")
                            .foregroundStyle(Color.black)
                            .fontWeight(.semibold)
                            .font(.system(size: 40))
                            .offset(x: -50)
                        Text("It's 6 hours before sleep!")
                            .foregroundStyle(Color.black)
                            .fontWeight(.medium)
                            .font(.system(size: 20))
                            .offset(x: 1)
                            .lineLimit(1)
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
                .border(Color.blue)

                ZStack {
                    Image("chillatips2")
                        .offset(x: -8.5, y: -12)
                        
                    Text("Welcome!\nLater, You can see your sleep report here!")
                        .foregroundStyle(Color.white)
                        .fontWeight(.medium)
                        .font(.system(size: 17))
                        .offset(y: 20)
                        .frame(width: 305, height: 73, alignment: .top)
                }
                .border(Color.black)

                Text("Today’s Habit☀️")
                Text("Seems like you don’t have any habit list\nimprove. Set your habit reminder in the\nexplore page or")

                RoundedButton(
                    title: "Tap Here",
                    action: {
                        
                    },
                    backgroundColor: .primaryButton,
                    foregroundColor: .white,
                    cornerRadius: 15
                )
            }.border(Color.red)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}


#Preview {
    DashboardView2()
}
