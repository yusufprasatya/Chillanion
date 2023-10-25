//
//  TodayStepView.swift
//  SleepWell
//
//  Created by Billbert Pohandy on 25/10/23.
//

import SwiftUI


struct TodayStepView: View {
    
    @State private var StepBarProgress: Float = 0.5
    
    
    var body: some View {
      Text("Today's step")
        StepProgressBar(stepprogress: $StepBarProgress)
            .frame(width: 80, height: 100)
    }
}

#Preview {
    TodayStepView()
}

