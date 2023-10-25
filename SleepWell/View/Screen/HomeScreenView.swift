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
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.darkGreen.ignoresSafeArea(.all)
                
                VStack(alignment: .center) {
                    Text("Hello, \(userViewModel.name)")
                        .font(.title)
                        .foregroundColor(.white)
                    Text("Your Sleep Time Goal \(DateUtil.formatDateToString(param: userViewModel.bedTimeCommitment))")
                        .font(.title)
                        .foregroundColor(.white)
                    Text("Total \(stepCount)")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    
                    Text("Today Step \(todaysStep)")
                        .font(.title)
                        .foregroundColor(.white)
                }
                
            }
            .onAppear{
                userViewModel.getUser()
                health.fetchStepCount { steps, error in
                    if let steps = steps {
                        self.stepCount = steps
                    } else if let error = error {
                        print("error")
                    }
                }
                
                health.getTodaysSteps { step in
                    self.todaysStep = step
                }
            }
        }
    }
}

#Preview {
    HomeScreenView()
}
