//
//  ContentView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    init() {
        UITabBar.appearance().barTintColor = .black
    }
    
    var body: some View {
        if UserDefaults.standard.onBoardingShow {
            HomeScreenView()
        }else {
            OnBoardingView()
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
}

#Preview {
    ContentView()
}
