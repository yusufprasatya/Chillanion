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

    @State private var selectedTab = 0
    @State private var isOverlayVisible = true

    init() {
        UITabBar.appearance().barTintColor = UIColor(Color.navyBlueTabBar)
    }

    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                DashboardView()
                    .tabItem {
                        Label("Dashboard", systemImage: "star.fill")
                    }
                    .tag(0)

                Text("Under development")
                    .tabItem {
                        Label("My Sleep", systemImage: "moon.zzz")
                    }
                    .tag(1)

                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle")
                    }
                    .tag(2)
            }
            .accentColor(.BarIconColor)
            .overlay(
                Color.black.opacity(isOverlayVisible ? 0.85 : 0)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            isOverlayVisible.toggle()
                        }
                    }
            )

            // This will keep the Dashboard area visible
            DashboardViewOverlay()
                .opacity(isOverlayVisible ? 1 : 0)
        }
    }
}

struct DashboardViewOverlay: View {
    @State private var currentImageIndex = 0

    let imageNames = ["TeacherKoala", "TeacherKoala2", "TeacherKoala3", "TeacherKoala4"]

    let imageFrames: [CGRect] = [
        CGRect(x: 0, y: -92, width: 344, height: 478),     // Frame for TeacherKoala
        CGRect(x: -10, y: -96, width: 365, height: 438),   // Frame for AnotherImage
        CGRect(x: 10, y: 100, width: 365, height: 413),  // Frame for ThirdImage
        CGRect(x: -5, y: 277, width: 367, height: 845)   // Frame for FourthImage
    ]

    var body: some View {
        ScrollViewReader { scrollViewProxy in
            Image(imageNames[currentImageIndex])
                .resizable()
                .scaledToFit()
                .frame(width: imageFrames[currentImageIndex].width, height: imageFrames[currentImageIndex].height)
                .offset(x: imageFrames[currentImageIndex].origin.x, y: imageFrames[currentImageIndex].origin.y)
                .onAppear {
                    // Automatically scroll to the bottom when the fourth image appears
                    if currentImageIndex == 3 {
                        withAnimation {
                            scrollViewProxy.scrollTo(imageNames.count - 1)
                        }
                    }
                }
                .onTapGesture {
                    withAnimation {
                        currentImageIndex = (currentImageIndex + 1) % imageNames.count
                    }
                }
        }
    }
}

    #Preview {
        HomeScreenView()
    }

