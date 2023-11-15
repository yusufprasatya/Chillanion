//
//  ContentView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var isSplashNotAppear = false
    
    init() {
        UITabBar.appearance().barTintColor = .black
    }
    
    var body: some View {
        ZStack {
            if isSplashNotAppear {
                if UserDefaults.standard.onBoardingShow {
                    HomeScreenView()
                }else {
                    OnBoardingView()
                }
            }else{
                SplashScreenView()
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    self.isSplashNotAppear = true
                }
            }
        }
    }
}

extension UserDefaults {
    var onBoardingShow: Bool {
        get {
            return (UserDefaults.standard.value(forKey: "onBoardingShow") as? Bool) ?? false
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "onBoardingShow")
        }
    }
    
    var showCaseDashboard: Bool {
        get {
            return (UserDefaults.standard.value(forKey: "showCaseDashboard") as? Bool) ?? false
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "showCaseDashboard")
        }
    }
}

#Preview {
    ContentView()
}
