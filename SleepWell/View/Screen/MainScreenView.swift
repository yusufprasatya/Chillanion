//
//  MainScreenView.swift
//  SleepWell
//
//  Created by Billbert Pohandy on 16/10/23.
//
import SwiftUI

struct MainScreenView: View {
    @State private var SleepBarProgress: Float = 0.5
    @State private var StepBarProgress: Float = 0.5
    @State private var isCaffeineSelected = false
    @State private var isNapSelected = false
    @State private var isJournalingSelected = false
    
    let sleepQualityData: [Double] = [8, 7, 9, 8, 9, 7, 8]

    var body: some View {
        NavigationStack{
        ScrollView {
            
            ZStack {
                VStack(alignment: .leading) {
                    HStack {
                        VStack{
                            
                            Text("Hi, Billbert!")
                                .font(.largeTitle)
                                .foregroundStyle(Color.white)
                                .fontWeight(.bold)
                                .font(.system(size: 34))
                                .padding(.top, -15)
                                .fixedSize(horizontal: true, vertical: false)
                                .frame(width: 110, alignment: .leading)
                            
                            
                            Text("Your last\nnight's sleep:")
                                .foregroundStyle(Color.white)
                                .fontWeight(.bold)
                                .font(.system(size: 17))
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                                .padding(.top, 6)
                            
                            
                            Text("50%")
                                .foregroundStyle(Color.white)
                                .fontWeight(.bold)
                                .font(.system(size: 32))
                                .multilineTextAlignment(.leading)
                                .padding(.top, 6)
                                .frame(width: 110, alignment: .leading)
                        }
                        Spacer()
                        ZStack{
                            CircularBarScreen(progress: $SleepBarProgress)
                            
                            Image("KoalaSad")
                                .resizable()
                                .frame(width: 133, height: 96)
                                .padding(.top, 50)
                                .padding(.leading, 12)
                        }
                    }
                    Spacer(minLength: 40)
                    NavigationLink(destination: SleepReminderView()) {ZStack{
                        
                        Image("SleepGoal")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 342, height: 157)
                        
                        Text("22.30")
                            .foregroundStyle(Color.white)
                            .fontWeight(.bold)
                            .font(.system(size: 40))
                        
                            .padding(.leading, -150)
                            .padding(.top, 16)
                    }
                    }
                    
                    Text("Activities:")
                        .font(.system(size: 20))
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                        .padding(.leading, 5)
                        .padding(.top, -10)
                    NavigationLink(destination: NewMainScreenView()) {ZStack{
                        Image("StepBackground")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 342, height: 157)
                            .padding(.top, -5)
                        HStack{
                            Spacer()
                            Text("2250")
                            
                                .font(.system(size: 34))
                                .fontWeight(.bold)
                                .foregroundStyle(Color.white)
                            + Text("/4500 step")
                                .font(.system(size: 17))
                                .foregroundStyle(Color.white)
                            Spacer()
                            
                            StepProgressBar(stepprogress: $StepBarProgress)
                                .frame(width: 80, height: 100)
                            Spacer()
                        }
                    }
                    }
                    VStack {
                        Button(action: {
                            isCaffeineSelected.toggle()
                        }) {
                            VStack {
                                HStack {
                                    Image("coffee")
                                        .resizable()
                                        .frame(width: 43, height: 43)
                                        .foregroundColor(.white)
                                        .padding(.leading, 25)
                                    
                                    Text("Limit Caffeine")
                                        .font(.system(size: 20))
                                        .frame(width: 285, height: 66)
                                        .padding(.leading, -80)
                                        .foregroundColor(.white)
                                    
                                    Image(systemName: isCaffeineSelected ? "checkmark.square.fill" : "square.fill")
                                        .foregroundColor(.buttoncolor)
                                        .font(.system(size: 35))
                                        .padding(.trailing, 10)
                                }
                                .background(isCaffeineSelected ? Color.activitybg : Color.activitybg)
                                .cornerRadius(10)
                            }
                        }
                        Button(action: {
                            isNapSelected.toggle()
                        }) {
                            HStack {
                                Image("nap")
                                    .resizable()
                                    .frame(width: 43, height: 43)
                                    .foregroundColor(.white)
                                    .padding(.leading, 25)
                                Text("Power Nap")
                                    .font(.system(size: 20))
                                    .frame(width: 310, height: 66)
                                    .padding(.leading, -105)
                                    .foregroundColor(.white)
                                Image(systemName: isNapSelected ? "checkmark.square.fill" : "square.fill")
                                    .foregroundColor(.buttoncolor)
                                    .font(.system(size: 35))
                                    .padding(.trailing, 10)
                            }
                            .background(isNapSelected ? Color.activitybg : Color.activitybg)
                            .cornerRadius(10)
                        }
                        
                        Button(action: {
                            isJournalingSelected.toggle()
                        }) {
                            HStack {
                                Image("journaling")
                                    .resizable()
                                    .frame(width: 43, height: 43)
                                    .foregroundColor(.white)
                                    .padding(.leading, 25)
                                
                                Text("Journaling")
                                    .font(.system(size: 20))
                                    .frame(width: 310, height: 66)
                                    .padding(.leading, -105)
                                    .foregroundColor(.white)
                                
                                Image(systemName: isJournalingSelected ? "checkmark.square.fill" : "square.fill")
                                    .foregroundColor(.buttoncolor)
                                    .font(.system(size: 35))
                                    .padding(.trailing, 10)
                            }
                            .background(isJournalingSelected ? Color.activitybg : Color.activitybg)
                            .cornerRadius(10)
                        }
                    }
                    
                    
                    //                    ZStack{
                    //                        Image("SleepActivity")
                    //                            .resizable()
                    //                            .scaledToFill()
                    //                           /* .frame(width: UIScreen.main.bounds.width - 10)*/ // Adjust the image width if needed
                    //                        SleepQualityBarChart(data: sleepQualityData, showDayLabels: false)
                    //                            .padding(.top, 20)
                    //                            .padding(.horizontal, 20)
                    //                    }
                    
                    NavigationLink(destination: NewMainScreenView()) {Image("JournalBackground")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 342, height: 157)
                            .padding(.top, 35)
                    }
                }
                .padding(.horizontal, 40)
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
}

struct TabBarView: View {
    @State private var selectedTab = 0

    init() {
        UITabBar.appearance().barTintColor = .black
    }

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
