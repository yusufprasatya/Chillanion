//
//  Screen12LoadingView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 17/10/23.
//

import SwiftUI

struct Screen12LoadingView: View {
    @State private var isLoading: Bool = true
    @State private var progressValue = false
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            VStack (spacing: 20) {
                Spacer()
                ZStack {
                    CircularDotProgressView()
                    Image("koalaInTheMoon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 114)
                        .padding(.leading, -20)
                }
                
                Text("Give us a second! We will give you the calculation of your sleep duration!")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .padding(.top, 30)
                
                Spacer()
                Spacer()
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    Screen12LoadingView()
}
