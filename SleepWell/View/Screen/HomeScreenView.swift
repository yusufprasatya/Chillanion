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
    @State private var isOverlayVisible = true
    
    var body: some View {
        // created by bilbert pohandy
        TabView() {
            // First Tab: MainScreenView
            Group {
                DashboardView()
                    .tabItem {
                        Label("Dashboard", systemImage: "star.fill")
                    }
                // Second Tab: Placeholder view
                MySleepView()
                    .tabItem {
                        Label("My Sleep", systemImage: "moon.zzz")
                    }
                // Third Tab: Placeholder view
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle")
                    }
            }
            .toolbarBackground(Color.navyBlueTabBar, for: .tabBar)
        }
        .onAppear(perform: {
            let tabBarAppearance = UITabBarAppearance()
                           tabBarAppearance.configureWithOpaqueBackground()
                           UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
                           // correct the transparency bug for Navigation bars
                           let navigationBarAppearance = UINavigationBarAppearance()
                           navigationBarAppearance.configureWithOpaqueBackground()
                           UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        })
        .accentColor(.BarIconColor)
        .overlay(
            Group {
                if !UserDefaults.standard.showCaseDashboard {
                    Color.black.opacity(0.91)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation {
                                if isOverlayVisible { // Add a check here
                                    isOverlayVisible.toggle()
                                }
                            }
                        }
                }
            }
        )
        if !UserDefaults.standard.showCaseDashboard{
            // This will keep the Dashboard area visible
            DashboardViewOverlay(isOverlayVisible: $isOverlayVisible)
                .opacity(isOverlayVisible ? 1 : 0)
        }
        
    }
}

struct DashboardViewOverlay: View {
    @Binding var isOverlayVisible: Bool
    @State private var currentImageIndex = 0
    
    @AppStorage("showCaseDashboard")
    var showCaseDashboard: Bool = true
    
    let maxImageCount = 5 // Set the desired limit
    
    let imageNames = ["TeacherKoala", "TeacherKoala2", "TeacherKoala3", "TeacherKoala4", "TeacherKoala5"]
    
    let imageFrames: [CGRect] = [
        CGRect(x: 0, y: 0, width: 390, height: 844),
        CGRect(x: 0, y: 10, width: 390, height: 844),
        CGRect(x: 0, y: 0, width: 390, height: 844),
        CGRect(x: 0, y: 0, width: 390, height: 844),
        CGRect(x: 0, y: 0, width: 390, height: 844)
    ]
    
    var body: some View {
        ScrollViewReader { scrollViewProxy in
            if isOverlayVisible {
                Color.clear
                    .overlay(
                        Image(imageNames[currentImageIndex])
                            .resizable()
                            .scaledToFit()
                            .frame(width: imageFrames[currentImageIndex].width, height: imageFrames[currentImageIndex].height)
                            .offset(x: imageFrames[currentImageIndex].origin.x, y: imageFrames[currentImageIndex].origin.y)
                            .contentShape(Rectangle())
                            .transition(
                                currentImageIndex < 3 ? .identity : .slide
                            )
                            .animation(
                                currentImageIndex < 3 ? nil : .easeOut(duration: 1.0)
                            )
                            .onTapGesture {
                                withAnimation {
                                    currentImageIndex = (currentImageIndex + 1) % imageNames.count
                                    if currentImageIndex == 0 {
                                        isOverlayVisible = false
                                    }
                                }
                            }
                            .onChange(of: currentImageIndex) { newIndex in
                                print("Current index \(newIndex)")
                                if newIndex == 4 {
                                    print(UserDefaults.standard.showCaseDashboard)
                                    UserDefaults.standard.showCaseDashboard = true
                                    UserDefaults.standard.showCaseDashboard = showCaseDashboard
                                }
                            }
                    )
            }
        }
    }
}

#Preview {
    HomeScreenView()
}
