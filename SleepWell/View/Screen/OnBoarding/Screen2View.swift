//
//  Screen7View.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 17/10/23.
//

import SwiftUI

struct Screen7View: View {
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            VStack (spacing: 20) {
                Text("We understand..")
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                    .padding(.top, 45)
                    .padding(.leading, 0)
                
                Text("... The joy that comes from having someone accompany us on our journey of improvement!")
                    .foregroundStyle(.white)
                    .padding()
                
                Text("So..")
                    .foregroundStyle(.white)
                    .padding()
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    Screen7View()
}
