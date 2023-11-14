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
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            Image("Union1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 405, height: 215)
                .padding(.leading, -160)
                .padding(.top, 100)
                .offset(x: union1Appear)
            
            
            Image("Union")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 466, height: 270)
                .padding(.trailing, -70)
                .padding(.top, 200)
                .offset(x: unionAppear)
            
            Image("KoalaSplashScreen")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 270, height: 270)
                .padding(.bottom, 50)
                .padding(.top,20)
                .offset(y: chillaAppear)
            
            VStack{
                Spacer()
                TextAnimationView(text: "Chillanion")
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 1)) {
                chillaAppear = 0
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
