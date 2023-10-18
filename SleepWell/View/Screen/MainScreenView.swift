//
//  MainScreenView.swift
//  SleepWell
//
//  Created by Billbert Pohandy on 16/10/23.
//
import SwiftUI

struct MainScreenView: View {
   
    let sleepQualityData: [Double] = [8, 7, 9, 8, 9, 7, 8]

    var body: some View {
        ScrollView {
            ZStack {
                VStack(alignment: .leading) {
                  
                    HStack {
                        Text("Hi, Billbert!")
                            .font(.largeTitle)
                            .foregroundStyle(Color.white)
                            .fontWeight(.bold)
                            .font(.system(size: 34))
                            .padding(.leading, 5)
                            .padding(.top, 35)
                           
                    }
                    Text("Nighty Night")
                        .font(.system(size: 20))
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                        .padding(.leading, 5)
                        .padding(.top, 60)
                    
                    ZStack{
                        Image("SleepGoal")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width - 19) // Adjust the image width if needed
                    }
                    
                    Text("Your activity")
                        .font(.system(size: 20))
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                        .padding(.leading, 5)
                        .padding(.top, 20)
                    
                    ZStack{
                        Image("SleepActivity")
                            .resizable()
                            .scaledToFill()
                           /* .frame(width: UIScreen.main.bounds.width - 10)*/ // Adjust the image width if needed
                        SleepQualityBarChart(data: sleepQualityData, showDayLabels: false)
                                          .padding(.top, 20)
                                          .padding(.horizontal, 20)
                    }
                    
                    Text("Day Activity")
                        .font(.system(size: 20))
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                        .padding(.leading, 5)
                        .padding(.top, 20)
                    
                    HStack {
                        Image("StepBackground")
                            .resizable()
                            .scaledToFit()
                          
                        
                        Image("SunlightBackground")
                            .resizable()
                            .scaledToFit()
                          
                        
                        Image("NapBackground")
                            .resizable()
                            .scaledToFit()
                           
                    }
                    Text("Stop At The Right Time")
                        .font(.system(size: 20))
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                        .padding(.leading, 5)
                        .padding(.top, 20)
                    
                    HStack {
                        Image("CafeBackground")
                            .resizable()
                            .scaledToFit()
                           
                        
                        Image("MealBackground")
                            .resizable()
                            .scaledToFit()
                          
                        
                        Image("WorkoutBackground")
                            .resizable()
                            .scaledToFit()
                            
                    }
                    Text("Time To Wind Down")
                        .font(.system(size: 20))
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                        .padding(.leading, 5)
                        .padding(.top, 20)
                    HStack {
                        Image("JournalBackground")
                            .resizable()
                            .scaledToFit()
                            
                        Image("DimBackground")
                            .resizable()
                            .scaledToFit()
                           
                        Image("SkinBackground")
                            .resizable()
                            .scaledToFit()
                          
                    }
              
                }
                .padding(.horizontal, 32)
                .background(
                                Image("MainBackground")
                                    .resizable()
                                    .scaledToFill()
                                    .edgesIgnoringSafeArea(.all)
                                )
            }
           
        }
    }
}

struct TabBarView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            // First Tab: MainScreenView
            MainScreenView()
                .tabItem {
                    Label("Summary", systemImage: "star.fill")
                }
                .tag(0)
            
            
            // Second Tab: Placeholder view
            Text("Second Tab Content")
                .tabItem {
                    Label("My Sleep", systemImage: "star.fill")
                }
                .tag(1)
            
            // Third Tab: Placeholder view
            Text("Third Tab Content")
                .tabItem {
                    Label("Tab Name", systemImage: "star.fill")
                }
                .tag(2)
        }
        .accentColor(.BarIconColor)
      
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
