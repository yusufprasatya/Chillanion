//
//  SplashScreenView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 31/10/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var chillaAppear: CGFloat = -600
    @State private var unionAppear: CGFloat = 400
    @State private var union1Appear: CGFloat = -400
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blueGray, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                Image("KoalaSplashScreen")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 237, height: 226)
                    .padding(.bottom, 50)
                    .padding(.top,20)
//                    .offset(y: chillaAppear)
                Spacer()
                TextAnimationView(text: "Chillanion")
            }
        }
        .onAppear {
            withAnimation {
//                chillaAppear = 0
                unionAppear = 0
                union1Appear = 0
            }
        }
    }
}

struct TextAnimationView: View {
    let text: String
    @State private var animatedText = ""
    
    var body: some View {
        Text(animatedText)
            .font(.system(size: 30, weight: .semibold, design: .rounded))
            .foregroundColor(.goldenYellow)
            .onAppear {
                animateText()
            }
    }
    
    func animateText() {
        for (index, character) in text.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.1) {
                animatedText.append(character)
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
