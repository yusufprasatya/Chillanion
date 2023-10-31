//
//  HomeScreenView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 10/10/23.
//

import SwiftUI

struct HomeScreenView: View {
    @ObservedObject private var userViewModel = UserViewModel()
    @ObservedObject private var health = SleepManager()
    
    @State private var stepCount: Double = 0
    @State private var todaysStep: Double = 0
    @State private var selectedTab = 0
    
    var body: some View {
        // created by bilbert pohandy
        TabView(selection: $selectedTab) {
            // First Tab: MainScreenView
            Group {
                DashboardView()
                    .tabItem {
                        Label("Dashboard", systemImage: "star.fill")
                    }
                    .tag(0)
                
                // Second Tab: Placeholder view
                Text("Under develop")
                    .tabItem {
                        Label("My Sleep", systemImage: "moon.zzz")
                    }
                    .tag(1)
                
                // Third Tab: Placeholder view
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle")
                    }
                    .tag(2)
            }
            .toolbarBackground(Color.navyBlueTabBar, for: .tabBar)
        }
        .accentColor(.BarIconColor)
    }
}

#Preview {
    HomeScreenView()
}
